#!/usr/bin/env bash
#
# Build, sign, notarize, and package the macOS app for direct (non-App-Store)
# distribution as a notarized .dmg.
#
# Prerequisites (one-time, see scripts/README_macos_signing.md):
#   1. A "Developer ID Application" certificate installed in your login keychain.
#   2. A stored notarytool credential profile (default name: redtailridgeoffice).
#
# Usage:
#   ./scripts/build_macos_dist.sh
#
# Optional environment overrides:
#   NOTARY_PROFILE   notarytool keychain profile name (default: redtailridgeoffice)
#   SIGN_IDENTITY    exact codesign identity (default: auto-detect Developer ID Application)
#   SKIP_BUILD=1     reuse the existing Release build instead of rebuilding
#   SKIP_NOTARIZE=1  sign + package only, skip notarization (for local testing)

set -euo pipefail

APP_NAME="red_tail_ridge_office"
APP_PATH="build/macos/Build/Products/Release/${APP_NAME}.app"
ENTITLEMENTS="macos/Runner/Release.entitlements"
DIST_DIR="dist"
ZIP_PATH="${DIST_DIR}/${APP_NAME}.zip"
DMG_PATH="${DIST_DIR}/${APP_NAME}.dmg"
NOTARY_PROFILE="${NOTARY_PROFILE:-redtailridgeoffice}"

# Resolve repo root so the script works from anywhere.
cd "$(dirname "$0")/.."

log() { printf '\n\033[1;34m==>\033[0m %s\n' "$*"; }
fail() { printf '\n\033[1;31mError:\033[0m %s\n' "$*" >&2; exit 1; }

# --- 0. Resolve signing identity ---------------------------------------------
if [ -n "${SIGN_IDENTITY:-}" ]; then
  IDENTITY="$SIGN_IDENTITY"
else
  IDENTITY=$(security find-identity -v -p codesigning \
    | awk -F'"' '/Developer ID Application/ {print $2; exit}')
fi
[ -n "$IDENTITY" ] || fail "No 'Developer ID Application' identity found in the keychain.
       Create one in Xcode > Settings > Accounts > Manage Certificates,
       then re-run. See scripts/README_macos_signing.md."
log "Signing identity: $IDENTITY"

# --- 1. Build ----------------------------------------------------------------
if [ "${SKIP_BUILD:-0}" != "1" ]; then
  log "Building Release app"
  fvm flutter build macos --release
fi
[ -d "$APP_PATH" ] || fail "Build output not found at $APP_PATH"

# --- 2. Sign nested code bottom-up, then the app itself ----------------------
log "Signing nested frameworks and dylibs"
# Dylibs first.
while IFS= read -r -d '' dylib; do
  codesign --force --timestamp --options runtime --sign "$IDENTITY" "$dylib"
done < <(find "$APP_PATH/Contents/Frameworks" -name '*.dylib' -print0 2>/dev/null || true)

# Then each embedded framework bundle.
for fw in "$APP_PATH"/Contents/Frameworks/*.framework; do
  [ -e "$fw" ] || continue
  codesign --force --timestamp --options runtime --sign "$IDENTITY" "$fw"
done

log "Signing the app bundle (hardened runtime + entitlements)"
codesign --force --timestamp --options runtime \
  --entitlements "$ENTITLEMENTS" \
  --sign "$IDENTITY" "$APP_PATH"

log "Verifying signature"
codesign --verify --deep --strict --verbose=2 "$APP_PATH"

# --- 3. Notarize the app -----------------------------------------------------
mkdir -p "$DIST_DIR"
if [ "${SKIP_NOTARIZE:-0}" != "1" ]; then
  log "Submitting app for notarization (profile: $NOTARY_PROFILE)"
  ditto -c -k --keepParent "$APP_PATH" "$ZIP_PATH"
  xcrun notarytool submit "$ZIP_PATH" --keychain-profile "$NOTARY_PROFILE" --wait
  rm -f "$ZIP_PATH"
  log "Stapling notarization ticket to the app"
  xcrun stapler staple "$APP_PATH"
else
  log "SKIP_NOTARIZE=1 set — skipping app notarization"
fi

# --- 4. Package as a DMG, then sign + notarize the DMG -----------------------
log "Creating DMG"
rm -f "$DMG_PATH"
hdiutil create -volname "$APP_NAME" -srcfolder "$APP_PATH" \
  -ov -format UDZO "$DMG_PATH"
codesign --force --timestamp --sign "$IDENTITY" "$DMG_PATH"

if [ "${SKIP_NOTARIZE:-0}" != "1" ]; then
  log "Notarizing and stapling the DMG"
  xcrun notarytool submit "$DMG_PATH" --keychain-profile "$NOTARY_PROFILE" --wait
  xcrun stapler staple "$DMG_PATH"
fi

# --- 5. Final Gatekeeper check ----------------------------------------------
log "Gatekeeper assessment"
spctl --assess --type open --context context:primary-signature --verbose "$DMG_PATH" || true

log "Done: $DMG_PATH"
