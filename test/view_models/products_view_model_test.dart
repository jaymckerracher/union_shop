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
    expect(viewModel.getProducts.length, viewModel.products.length);
  });

  test('filter by category returns only matching products', () {
    viewModel.updateFilter(category: ProductCategory.clothing);
    expect(
        viewModel.getProducts
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
          viewModel.getProducts
              .every((p) => p.collections.contains(testCollection)),
          isTrue);
    }
  });

  test('filter by every collection value returns correct products', () {
    const allCollections = Collections.values;
    for (final collection in allCollections) {
      viewModel.updateFilter(collection: collection);
      final filtered = viewModel.getProducts;
      if (filtered.isNotEmpty) {
        expect(
            filtered.every((p) => p.collections.contains(collection)), isTrue,
            reason: 'All products should contain the collection $collection');
      }
    }
  });

  test('filter by onSale returns only products on sale', () {
    viewModel.updateFilter(onSale: true);
    expect(viewModel.getProducts.every((p) => p.onSale), isTrue);
  });

  test('filter by category and collection returns intersection', () {
    // Find a category and collection that overlap
    final allCollections =
        viewModel.products.expand((p) => p.collections).toSet();
    for (final collection in allCollections) {
      final matchingProducts =
          viewModel.products.where((p) => p.collections.contains(collection));
      if (matchingProducts.isNotEmpty) {
        final category = matchingProducts.first.category;
        viewModel.updateFilter(category: category, collection: collection);
        expect(
          viewModel.getProducts.every((p) =>
              p.category == category && p.collections.contains(collection)),
          isTrue,
        );
      }
    }
  });

  test('filter by category, collection, and onSale returns correct products',
      () {
    final allCollections =
        viewModel.products.expand((p) => p.collections).toSet();
    for (final collection in allCollections) {
      final matchingProducts = viewModel.products
          .where((p) => p.collections.contains(collection) && p.onSale);
      if (matchingProducts.isNotEmpty) {
        final category = matchingProducts.first.category;
        viewModel.updateFilter(
            category: category, collection: collection, onSale: true);
        expect(
          viewModel.getProducts.every((p) =>
              p.category == category &&
              p.collections.contains(collection) &&
              p.onSale),
          isTrue,
        );
      }
    }
  });

  test('filter with no matches returns empty list', () {
    // Use a combination that is unlikely to exist
    viewModel.updateFilter(
        category: ProductCategory.clothing,
        collection: Collections.halloween,
        onSale: true);
    expect(viewModel.getProducts, isEmpty);
  });

  test('clearFilter resets to all products', () {
    viewModel.updateFilter(category: ProductCategory.clothing);
    viewModel.clearFilter();
    expect(viewModel.getProducts.length, viewModel.products.length);
  });

  test('clearFilter resets to all products', () {
    viewModel.updateFilter(category: ProductCategory.clothing);
    viewModel.clearFilter();
    expect(viewModel.getProducts.length, viewModel.products.length);
  });

  test('getProductById returns correct product when id exists', () {
    final firstProduct = viewModel.products.first;
    final foundProduct = viewModel.getProductById(firstProduct.id);
    expect(foundProduct, isNotNull);
    expect(foundProduct!.id, firstProduct.id);
  });

  test('getProductById returns null when id does not exist', () {
    final foundProduct = viewModel.getProductById('nonexistent_id_123');
    expect(foundProduct, isNull);
  });

  test('searchProducts returns products with matching title', () {
    // Use the title of the first product as a query
    final firstProduct = viewModel.products.first;
    final query = firstProduct.title.substring(0, 3); // partial match
    final results = viewModel.searchProducts(query);
    expect(results.any((p) => p.id == firstProduct.id), isTrue);
  });

  test('searchProducts is case-insensitive', () {
    final firstProduct = viewModel.products.first;
    final query = firstProduct.title.substring(0, 3).toUpperCase();
    final results = viewModel.searchProducts(query);
    expect(results.any((p) => p.id == firstProduct.id), isTrue);
  });

  test('searchProducts returns empty list for no match', () {
    final results = viewModel.searchProducts('thisshouldnotmatchanything');
    expect(results, isEmpty);
  });
}
