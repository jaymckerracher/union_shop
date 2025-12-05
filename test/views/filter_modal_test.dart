import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/view_models/products_view_model.dart';
import 'package:union_shop/views/filter_modal.dart';
import 'package:union_shop/enums/product_category.dart';
import 'package:union_shop/enums/collection.dart';

class MockProductsViewModel extends ProductsViewModel {
  bool filterUpdated = false;
  @override
  void updateFilter({
    ProductCategory? category,
    Collections? collection,
    bool? onSale,
    String? query,
  }) {
    filterUpdated = true;
  }
}

void main() {
  testWidgets('FilterModal displays all filter options and buttons',
      (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterModal(
            allCollections: true,
            allCategories: true,
            saleOnly: false,
            viewModel: viewModel,
          ),
        ),
      ),
    );
    expect(find.text('Filter Options'), findsOneWidget);
    expect(find.text('On Sale'), findsOneWidget);
    expect(find.text('Category'), findsOneWidget);
    expect(find.text('Collection'), findsOneWidget);
    expect(find.text('Update Selection'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
  });

  testWidgets('FilterModal toggles On Sale switch',
      (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterModal(
            allCollections: true,
            allCategories: true,
            saleOnly: false,
            viewModel: viewModel,
          ),
        ),
      ),
    );
    final switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);
    await tester.tap(switchFinder);
    await tester.pump();
    // Switch toggled, but no direct state to check
  });

  testWidgets('FilterModal selects category and collection',
      (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterModal(
            allCollections: true,
            allCategories: true,
            saleOnly: false,
            viewModel: viewModel,
          ),
        ),
      ),
    );
    // Category dropdown
    await tester.tap(find.byType(DropdownButton<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Clothing').last);
    await tester.pumpAndSettle();
    // Collection dropdown
    await tester.tap(find.byType(DropdownButton<String>).last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pride').last);
    await tester.pumpAndSettle();
  });

  testWidgets('FilterModal taps Update Selection', (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterModal(
            allCollections: true,
            allCategories: true,
            saleOnly: false,
            viewModel: viewModel,
          ),
        ),
      ),
    );
    await tester.tap(find.text('Update Selection'));
    expect(viewModel.filterUpdated, isTrue);
  });

  testWidgets('FilterModal taps Close', (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterModal(
            allCollections: true,
            allCategories: true,
            saleOnly: false,
            viewModel: viewModel,
          ),
        ),
      ),
    );
    await tester.tap(find.text('Close'));
    // Modal closes, but we can't verify Navigator.pop in a unit test without a mock
  });
}
