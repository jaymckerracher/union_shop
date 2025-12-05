import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collections_page.dart';

void main() {
  group('CollectionsPage Widget Tests', () {
    testWidgets('renders Collections title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsPage(),
        ),
      );
      expect(find.text('Collections'), findsOneWidget);
    });

    testWidgets('renders collection tiles', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsPage(),
        ),
      );
      // The number of tiles depends on your ProductsViewModel mock data.
      // For demonstration, check for at least one tile.
      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('renders images for each collection',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsPage(),
        ),
      );
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('renders collection labels', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionsPage(),
        ),
      );
      // Example: check for a known label, adjust as needed
      expect(find.textContaining('Classic'), findsWidgets);
    });

    // Navigation tests would require a mock or testable navigation function.
    // You can use a mock or a test route observer for this.
  });
}
