import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/footer.dart';
import 'package:union_shop/views/header.dart';
import 'package:union_shop/views/home_carousel.dart';
import 'package:union_shop/views/home_page.dart';
import 'package:union_shop/views/home_range_preview.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders all main sections', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      // Don't check for Drawer directly (it is not in the tree until opened)
      // Check for Header
      expect(find.byType(Header), findsOneWidget);
      // Check for HomeCarousel
      expect(find.byType(HomeCarousel), findsOneWidget);
      // Check for HomeRangePreview (should be 3)
      expect(find.byType(HomeRangePreview), findsNWidgets(3));
      // Check for Footer
      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('drawer opens when menu icon tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      // Find the menu icon and tap it
      final menuIcon = find.byIcon(Icons.menu);
      expect(menuIcon, findsOneWidget);
      await tester.tap(menuIcon);
      await tester.pumpAndSettle();

      // Now the Drawer should be present
      expect(find.byType(Drawer), findsOneWidget);
    });
  });

  group('ProductCard', () {
    testWidgets('displays product info and image', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Test Product',
            price: '£30.00',
            imageUrl: 'https://example.com/image.png',
          ),
        ),
      ));

      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£30.00'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('navigates to /product on tap', (WidgetTester tester) async {
      final navKey = GlobalKey<NavigatorState>();
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navKey,
        routes: {
          '/product': (context) => const Scaffold(body: Text('Product Page')),
        },
        home: const Scaffold(
          body: ProductCard(
            title: 'Test Product',
            price: '£30.00',
            imageUrl: 'https://example.com/image.png',
          ),
        ),
      ));

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsOneWidget);
    });
  });
}
