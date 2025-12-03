import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/view_models/products_view_model.dart';
import 'package:union_shop/enums/product_category.dart';
import 'package:union_shop/enums/collection.dart';

void main() {
  late ProductsViewModel viewModel;

  setUp(() {
    viewModel = ProductsViewModel();
  });

  test('initial getProducts returns all products', () {
    expect(viewModel.getProducts.length, viewModel.products.length);
  });

  group('sorting', () {
    test('sorts alphabetically ascending', () {
      viewModel.updateSort(sortBy: 'alphabetical', isAscending: true);
      final sorted = viewModel.getProducts;
      final titles = sorted.map((p) => p.title.toLowerCase()).toList();
      final sortedTitles = List<String>.from(titles)..sort();
      expect(titles, sortedTitles);
    });

    test('sorts alphabetically descending', () {
      viewModel.updateSort(sortBy: 'alphabetical', isAscending: false);
      final sorted = viewModel.getProducts;
      final titles = sorted.map((p) => p.title.toLowerCase()).toList();
      final sortedTitles = List<String>.from(titles)
        ..sort((a, b) => b.compareTo(a));
      expect(titles, sortedTitles);
    });

    test('sorts by price ascending', () {
      viewModel.updateSort(sortBy: 'price', isAscending: true);
      final sorted = viewModel.getProducts;
      final prices = sorted.map((p) => p.price).toList();
      final sortedPrices = List<double>.from(prices)..sort();
      expect(prices, sortedPrices);
    });

    test('sorts by price descending', () {
      viewModel.updateSort(sortBy: 'price', isAscending: false);
      final sorted = viewModel.getProducts;
      final prices = sorted.map((p) => p.price).toList();
      final sortedPrices = List<double>.from(prices)
        ..sort((a, b) => b.compareTo(a));
      expect(prices, sortedPrices);
    });
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

  test('search by query returns products with matching title (begins with)',
      () {
    final firstProduct = viewModel.products.first;
    final query = firstProduct.title.substring(0, 3); // partial match
    viewModel.filter = ProductsFilter(query: query);
    final results = viewModel.getProducts;
    expect(results.any((p) => p.id == firstProduct.id), isTrue);
  });

  test('search by query is case-insensitive', () {
    final firstProduct = viewModel.products.first;
    final query = firstProduct.title.substring(0, 3).toUpperCase();
    viewModel.filter = ProductsFilter(query: query);
    final results = viewModel.getProducts;
    expect(results.any((p) => p.id == firstProduct.id), isTrue);
  });

  test('search by query returns empty list for no match', () {
    viewModel.filter = ProductsFilter(query: 'thisshouldnotmatchanything');
    final results = viewModel.getProducts;
    expect(results, isEmpty);
  });

  test('currentFilter returns the current filter object', () {
    // Initially, should be default (all null)
    expect(viewModel.currentFilter.category, isNull);
    expect(viewModel.currentFilter.collection, isNull);
    expect(viewModel.currentFilter.onSale, isNull);
    expect(viewModel.currentFilter.query, isNull);

    // After updating filter
    viewModel.updateFilter(category: ProductCategory.clothing, onSale: true);
    expect(viewModel.currentFilter.category, ProductCategory.clothing);
    expect(viewModel.currentFilter.onSale, true);
    // Collection and query should remain null if not set
    expect(viewModel.currentFilter.collection, isNull);
    expect(viewModel.currentFilter.query, isNull);

    // After updating collection only
    viewModel.updateFilter(collection: Collections.halloween);
    expect(viewModel.currentFilter.collection, Collections.halloween);
    // Other values should be null (updateFilter overwrites all fields)
    expect(viewModel.currentFilter.category, isNull);
    expect(viewModel.currentFilter.onSale, isNull);
    expect(viewModel.currentFilter.query, isNull);

    // After setting query only
    viewModel.filter = ProductsFilter(query: 'testquery');
    expect(viewModel.currentFilter.query, 'testquery');
    // Other values should be null
    expect(viewModel.currentFilter.category, isNull);
    expect(viewModel.currentFilter.collection, isNull);
    expect(viewModel.currentFilter.onSale, isNull);

    // After clearing filter
    viewModel.clearFilter();
    expect(viewModel.currentFilter.category, isNull);
    expect(viewModel.currentFilter.collection, isNull);
    expect(viewModel.currentFilter.onSale, isNull);
    expect(viewModel.currentFilter.query, isNull);
  });

  test(
      'firstProductInEachCollection returns correct unique products for each collection',
      () {
    final products = viewModel.firstProductInEachCollection;
    // Collect all collections represented by the returned products
    final Set<Collections> seen = {};
    for (final product in products) {
      for (final collection in product.collections) {
        // Only the first product for each collection should be in the list
        if (!seen.contains(collection)) {
          seen.add(collection);
          // The product should contain the collection
          expect(product.collections.contains(collection), isTrue,
              reason: 'Product should contain the collection $collection');
        }
      }
    }
    // Each collection should only appear once
    expect(seen.length, products.length);
    // If there are products, the result should not be empty
    if (viewModel.products.isNotEmpty) {
      expect(products.isNotEmpty, isTrue);
    }
  });
}
