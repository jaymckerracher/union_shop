import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/view_models/products_view_model.dart';
import 'package:union_shop/enums/product_category.dart';
import 'package:union_shop/enums/collection.dart';

void main() {
  late ProductsViewModel viewModel;

  setUp(() {
    viewModel = ProductsViewModel();
  });

  test('initial filteredProducts returns all products', () {
    expect(viewModel.filteredProducts.length, viewModel.products.length);
  });

  test('filter by category returns only matching products', () {
    viewModel.updateFilter(category: ProductCategory.clothing);
    expect(
        viewModel.filteredProducts
            .every((p) => p.category == ProductCategory.clothing),
        isTrue);
  });

  test('filter by collection returns only matching products', () {
    // Find a collection that exists in at least one product
    final allCollections =
        viewModel.products.expand((p) => p.collections).toSet();
    if (allCollections.isNotEmpty) {
      final testCollection = allCollections.first;
      viewModel.updateFilter(collection: testCollection);
      expect(
          viewModel.filteredProducts
              .every((p) => p.collections.contains(testCollection)),
          isTrue);
    }
  });

  test('filter by onSale returns only products on sale', () {
    viewModel.updateFilter(onSale: true);
    expect(viewModel.filteredProducts.every((p) => p.onSale), isTrue);
  });

  test('clearFilter resets to all products', () {
    viewModel.updateFilter(category: ProductCategory.clothing);
    viewModel.clearFilter();
    expect(viewModel.filteredProducts.length, viewModel.products.length);
  });
}
