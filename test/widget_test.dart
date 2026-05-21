import 'package:flutter_test/flutter_test.dart';

import 'package:red_tail_ridge_office/main.dart';

void main() {
  testWidgets('Dashboard renders mini apps', (WidgetTester tester) async {
    await tester.pumpWidget(const RedTailRidgeOfficeApp());
    await tester.pumpAndSettle();

    expect(find.text('Office Dashboard'), findsOneWidget);
    expect(find.text('Prepare Payroll'), findsOneWidget);
  });
}