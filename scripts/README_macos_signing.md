# macOS distribution signing

This app is distributed **directly** (outside the Mac App Store) as a notarized
`.dmg`. That requires a *Developer ID Application* certificate and Apple
notarization. Run the whole pipeline with:

```sh
./scripts/build_macos_dist.sh
```

Before the first run, complete the two one-time steps below.

## 1. Install a "Developer ID Application" certificate

You currently have `Apple Development` and `Apple Distribution` certs, but **not**
a `Developer ID Application` cert (the one required for direct distribution).

Easiest path (you must be the Account Holder or an Admin on the Apple Developer
team):

1. Xcode → **Settings… → Accounts**.
2. Select your Apple ID → your team → **Manage Certificates…**.
3. Click **+** → **Developer ID Application**.
4. It is created and added to your **login** keychain automatically.

Verify:

```sh
security find-identity -v -p codesigning | grep "Developer ID Application"
```

(Alternatively, create it at https://developer.apple.com/account/resources/certificates
and double-click the downloaded `.cer` to install.)

## 2. Store notarization credentials

Create an **app-specific password** for your Apple ID at
https://appleid.apple.com → Sign-In and Security → App-Specific Passwords.

Then store a reusable notarytool profile (default name `redtailridgeoffice`):

```sh
xcrun notarytool store-credentials "redtailridgeoffice" \
  --apple-id "danielsgeorge@gmail.com" \
  --team-id "6ETVCU9YTF" \
  --password "<APP_SPECIFIC_PASSWORD>"
```

Find `<YOUR_TEAM_ID>` (10-char ID) at
https://developer.apple.com/account → Membership, or via:

```sh
security find-identity -v -p codesigning   # the (XXXXXXXXXX) after your name
```

## What the script does

1. `flutter build macos --release`
2. Re-signs nested dylibs/frameworks, then the app, with the Developer ID
   identity + **hardened runtime** (required for notarization) and the
   `Release.entitlements` (App Sandbox, user-selected read).
3. Zips and submits the app to Apple notarization, waits, and **staples** the
   ticket.
4. Builds a `.dmg`, signs it, notarizes + staples it.
5. Runs a Gatekeeper assessment.

Output: `dist/red_tail_ridge_office.dmg` — distributable to any Mac.

### Useful overrides

| Variable          | Purpose                                              |
| ----------------- | ---------------------------------------------------- |
| `SKIP_BUILD=1`    | Reuse the existing Release build.                    |
| `SKIP_NOTARIZE=1` | Sign + package only (local testing; not shippable).  |
| `NOTARY_PROFILE`  | Use a different stored notarytool profile name.      |
| `SIGN_IDENTITY`   | Force an exact codesign identity string.             |
