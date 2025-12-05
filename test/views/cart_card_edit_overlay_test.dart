import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/cart_card_edit_overlay.dart';

void main() {
  testWidgets('CartCardEditOverlay displays initial quantity and UI elements',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CartCardEditOverlay(
          initialQuantity: 3,
          onQuantityChanged: (_) {},
          onClose: () {},
        ),
      ),
    );

    // Check for title
    expect(find.text('Edit Quantity'), findsOneWidget);
    // Check for initial quantity in TextField
    expect(find.byType(TextField), findsOneWidget);
    expect(find.widgetWithText(TextField, '3'), findsOneWidget);
    // Check for add and remove buttons
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);
    // Check for Save button
    expect(find.text('Save'), findsOneWidget);
    // Check for close button
    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('CartCardEditOverlay increments and decrements quantity',
      (WidgetTester tester) async {
    int changedQuantity = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: CartCardEditOverlay(
          initialQuantity: 2,
          onQuantityChanged: (q) => changedQuantity = q,
          onClose: () {},
        ),
      ),
    );

    // Tap add button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.widgetWithText(TextField, '3'), findsOneWidget);

    // Tap remove button
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.widgetWithText(TextField, '2'), findsOneWidget);

    // Tap remove again (should not go below 1)
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.widgetWithText(TextField, '1'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.widgetWithText(TextField, '1'), findsOneWidget);
  });

  testWidgets('CartCardEditOverlay changes quantity via TextField',
      (WidgetTester tester) async {
    int changedQuantity = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: CartCardEditOverlay(
          initialQuantity: 5,
          onQuantityChanged: (q) => changedQuantity = q,
          onClose: () {},
        ),
      ),
    );

    // Enter new quantity in TextField
    await tester.enterText(find.byType(TextField), '7');
    await tester.pump();
    expect(find.widgetWithText(TextField, '7'), findsOneWidget);
  });

  testWidgets(
      'CartCardEditOverlay calls onQuantityChanged and onClose when Save is pressed',
      (WidgetTester tester) async {
    int changedQuantity = 0;
    bool closed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: CartCardEditOverlay(
          initialQuantity: 4,
          onQuantityChanged: (q) => changedQuantity = q,
          onClose: () => closed = true,
        ),
      ),
    );

    // Change quantity
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.widgetWithText(TextField, '5'), findsOneWidget);

    // Tap Save
    await tester.tap(find.text('Save'));
    await tester.pump();
    expect(changedQuantity, 5);
    expect(closed, isTrue);
  });

  testWidgets('CartCardEditOverlay calls onClose when close button is pressed',
      (WidgetTester tester) async {
    bool closed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: CartCardEditOverlay(
          initialQuantity: 2,
          onQuantityChanged: (_) {},
          onClose: () => closed = true,
        ),
      ),
    );

    // Tap close button
    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();
    expect(closed, isTrue);
  });
}
