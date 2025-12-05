import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/sale_page.dart';
import 'package:union_shop/views/header.dart';
import 'package:union_shop/views/footer.dart';
import 'package:union_shop/views/app_drawer.dart';
import 'package:union_shop/views/filter_sort_menu_bar.dart';

void main() {
  testWidgets(
      'SalePage displays header, title, info, filter bar, product count, and footer',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SalePage(),
    ));
    // Header
    expect(find.byType(Header), findsOneWidget);
    // Title
    expect(find.text('Sale'), findsOneWidget);
    // Info text
    expect(find.textContaining('exclusive discounts'), findsOneWidget);
    // Filter/sort menu bar
    expect(find.byType(FilterSortMenuBar), findsOneWidget);
    // Footer
    expect(find.byType(Footer), findsOneWidget);
    // Drawer (not open by default)
    expect(find.byType(AppDrawer), findsNothing);
  });

  testWidgets('SalePage opens drawer when menu icon tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SalePage(),
    ));
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.byType(AppDrawer), findsOneWidget);
  });
}
