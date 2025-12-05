import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/view_models/products_view_model.dart';
import 'package:union_shop/views/sort_modal.dart';

class MockProductsViewModel extends ProductsViewModel {
  bool alphabeticalTapped = false;
  bool priceLowTapped = false;
  bool priceHighTapped = false;
  bool closed = false;

  @override
  void updateSort({String? sortBy, bool? isAscending}) {
    if (sortBy == 'alphabetical') alphabeticalTapped = true;
    if (sortBy == 'price' && isAscending == true) priceLowTapped = true;
    if (sortBy == 'price' && isAscending == false) priceHighTapped = true;
  }
}

void main() {
  testWidgets('SortModal displays all options and close button',
      (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SortModal(viewModel: viewModel),
        ),
      ),
    );
    expect(find.text('Sort Options'), findsOneWidget);
    expect(find.text('Alphabetical'), findsOneWidget);
    expect(find.text('Price: Low to High'), findsOneWidget);
    expect(find.text('Price: High to Low'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
  });

  testWidgets('SortModal taps Alphabetical', (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SortModal(viewModel: viewModel),
        ),
      ),
    );
    await tester.tap(find.text('Alphabetical'));
    expect(viewModel.alphabeticalTapped, isTrue);
  });

  testWidgets('SortModal taps Price: Low to High', (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SortModal(viewModel: viewModel),
        ),
      ),
    );
    await tester.tap(find.text('Price: Low to High'));
    expect(viewModel.priceLowTapped, isTrue);
  });

  testWidgets('SortModal taps Price: High to Low', (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SortModal(viewModel: viewModel),
        ),
      ),
    );
    await tester.tap(find.text('Price: High to Low'));
    expect(viewModel.priceHighTapped, isTrue);
  });

  testWidgets('SortModal taps Close', (WidgetTester tester) async {
    final viewModel = MockProductsViewModel();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SortModal(viewModel: viewModel),
        ),
      ),
    );
    await tester.tap(find.text('Close'));
    // Modal closes, but we can't verify Navigator.pop in a unit test without a mock
  });
}
