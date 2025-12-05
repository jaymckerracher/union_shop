import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/filter_modal.dart';
import 'package:union_shop/views/filter_sort_menu_bar.dart';
import 'package:union_shop/view_models/products_view_model.dart';
import 'package:union_shop/views/sort_modal.dart';

void main() {
  late ProductsViewModel viewModel;

  setUp(() {
    viewModel = ProductsViewModel();
  });

  Widget buildTestWidget({
    bool allCollections = true,
    bool allCategories = true,
    bool saleOnly = false,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: FilterSortMenuBar(
          viewModel: viewModel,
          allCollections: allCollections,
          allCategories: allCategories,
          saleOnly: saleOnly,
        ),
      ),
    );
  }

  testWidgets('displays filter and sort labels', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    expect(find.text('FILTER BY'), findsOneWidget);
    expect(find.text('SORT BY'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);
    expect(find.text('Sort'), findsOneWidget);
  });

  testWidgets('displays filter and sort icons', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    expect(find.byIcon(Icons.tune), findsOneWidget);
    expect(find.byIcon(Icons.sort), findsOneWidget);
  });

  testWidgets('opens filter modal on filter button tap', (tester) async {
    await tester.pumpWidget(buildTestWidget());

    await tester.tap(find.byIcon(Icons.tune));
    await tester.pumpAndSettle();

    expect(find.byType(FilterModal, skipOffstage: false), findsOneWidget);
  });

  testWidgets('opens sort modal on sort button tap', (tester) async {
    await tester.pumpWidget(buildTestWidget());

    await tester.tap(find.byIcon(Icons.sort));
    await tester.pumpAndSettle();

    expect(find.byType(SortModal, skipOffstage: false), findsOneWidget);
  });
}
