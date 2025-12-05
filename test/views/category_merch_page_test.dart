import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/category_merch_page.dart';
import 'package:union_shop/view_models/products_view_model.dart';
import 'package:union_shop/views/header.dart';
import 'package:union_shop/views/footer.dart';
import 'package:union_shop/views/app_drawer.dart';
import 'package:union_shop/views/filter_sort_menu_bar.dart';

void main() {
  testWidgets(
      'CategoryMerchPage displays header, title, filter bar, product count, and footer',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<ProductsViewModel>(
        create: (_) => ProductsViewModel(),
        child: const MaterialApp(
          home: CategoryMerchPage(),
        ),
      ),
    );

    // Check for header
    expect(find.byType(Header), findsOneWidget);
    // Check for title
    expect(find.text('Merch Category'), findsOneWidget);
    // Check for filter/sort menu bar
    expect(find.byType(FilterSortMenuBar), findsOneWidget);
    // Check for product count text
    expect(find.textContaining('products'), findsOneWidget);
    // Check for footer
    expect(find.byType(Footer), findsOneWidget);
    // Check for drawer
    expect(find.byType(AppDrawer), findsNothing); // Drawer not open by default
  });

  testWidgets('CategoryMerchPage opens drawer when menu icon tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<ProductsViewModel>(
        create: (_) => ProductsViewModel(),
        child: const MaterialApp(
          home: CategoryMerchPage(),
        ),
      ),
    );
    // Add an AppBar to show the menu icon
    // Open the drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.byType(AppDrawer), findsOneWidget);
  });

  testWidgets('CategoryMerchPage displays correct product count',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<ProductsViewModel>(
        create: (_) => ProductsViewModel(),
        child: const MaterialApp(
          home: CategoryMerchPage(),
        ),
      ),
    );
    expect(find.text('10 products'), findsOneWidget);
  });
}
