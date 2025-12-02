import 'package:flutter/foundation.dart';
import '../repositories/products_repository.dart';
import '../models/product_model.dart';
import '../enums/collection.dart';
import '../enums/product_category.dart';

class ProductsFilter {
  ProductCategory? category;
  Collections? collection;
  bool? onSale;
  String? query;

  ProductsFilter({this.category, this.collection, this.onSale, this.query});
}

class ProductsSort {
  String sortBy;
  bool isAscending;

  ProductsSort({required this.sortBy, required this.isAscending});
}

class ProductsViewModel extends ChangeNotifier {
  final ProductsRepository _repository = ProductsRepository();
  late List<Product> products;
  ProductsFilter filter;
  ProductsSort sort = ProductsSort(sortBy: 'alphabetical', isAscending: true);

  ProductsViewModel({
    ProductCategory? category,
    Collections? collection,
    bool? onSale,
  }) : filter = ProductsFilter(
          category: category,
          collection: collection,
          onSale: onSale,
        ) {
    products = List<Product>.from(_repository.products);
  }

  List<Product> get getProducts {
    List<Product> filtered = products.where((product) {
      final matchesCategory =
          filter.category == null || product.category == filter.category;
      final matchesCollection = filter.collection == null ||
          product.collections.contains(filter.collection);
      final matchesOnSale =
          filter.onSale == null || product.onSale == filter.onSale;
      final matchesQuery = filter.query == null ||
          product.title.toLowerCase().startsWith(filter.query!.toLowerCase());
      return matchesCategory &&
          matchesCollection &&
          matchesOnSale &&
          matchesQuery;
    }).toList();

    // Sort the filtered list based on the sort object
    if (sort.sortBy == 'alphabetical') {
      filtered.sort((a, b) => sort.isAscending
          ? a.title.toLowerCase().compareTo(b.title.toLowerCase())
          : b.title.toLowerCase().compareTo(a.title.toLowerCase()));
    } else if (sort.sortBy == 'price') {
      filtered.sort((a, b) => sort.isAscending
          ? a.price.compareTo(b.price)
          : b.price.compareTo(a.price));
    }
    return filtered;
  }

  void clearFilter() {
    filter = ProductsFilter();
    notifyListeners();
  }

  void updateFilter({
    ProductCategory? category,
    Collections? collection,
    bool? onSale,
    String? query,
  }) {
    filter = ProductsFilter(
      category: category ?? filter.category,
      collection: collection ?? filter.collection,
      onSale: onSale ?? filter.onSale,
      query: query ?? filter.query,
    );
    notifyListeners();
  }

  void updateSort({String? sortBy, bool? isAscending}) {
    sort = ProductsSort(
      sortBy: sortBy ?? sort.sortBy,
      isAscending: isAscending ?? sort.isAscending,
    );
    notifyListeners();
  }

  Product? getProductById(String id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  ProductsFilter get currentFilter => filter;
}
