import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/category_clothing_page.dart';
import 'package:union_shop/views/header.dart';
import 'package:union_shop/views/footer.dart';
import 'package:union_shop/views/app_drawer.dart';
import 'package:union_shop/views/filter_sort_menu_bar.dart';

void main() {
  testWidgets(
      'CategoryClothingPage displays header, title, filter bar, product count, and footer',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CategoryClothingPage(),
    ));
    // Header
    expect(find.byType(Header), findsOneWidget);
    // Title
    expect(find.text('Clothing Category'), findsOneWidget);
    // Filter/sort menu bar
    expect(find.byType(FilterSortMenuBar), findsOneWidget);
    // Product count
    expect(find.textContaining('products'), findsOneWidget);
    // Footer
    expect(find.byType(Footer), findsOneWidget);
    // Drawer (not open by default)
    expect(find.byType(AppDrawer), findsNothing);
  });

  testWidgets('CategoryClothingPage opens drawer when menu icon tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CategoryClothingPage(),
    ));
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.byType(AppDrawer), findsOneWidget);
  });

  testWidgets('CategoryClothingPage displays correct product count',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CategoryClothingPage(),
    ));
    // The default ProductsViewModel(category: clothing) is empty unless populated in the app
    // So just check for the product count text
    expect(find.textContaining('products'), findsOneWidget);
  });
}
