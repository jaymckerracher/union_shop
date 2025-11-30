// import 'package:flutter/foundation.dart';
import '../repositories/products_repository.dart';
import '../models/product_model.dart';
import '../enums/collection.dart';
import '../enums/product_category.dart';

class ProductsFilter {
  ProductCategory? category;
  Collections? collection;
  bool? onSale;

  ProductsFilter({this.category, this.collection, this.onSale});
}

class ProductsViewModel {
  final ProductsRepository _repository = ProductsRepository();
  late List<Product> products;
  ProductsFilter filter = ProductsFilter();

  ProductsViewModel() {
    products = List<Product>.from(_repository.products);
  }

  List<Product> get filteredProducts {
    return products.where((product) {
      final matchesCategory =
          filter.category == null || product.category == filter.category;
      final matchesCollection = filter.collection == null ||
          product.collections.contains(filter.collection);
      final matchesOnSale =
          filter.onSale == null || product.onSale == filter.onSale;
      return matchesCategory && matchesCollection && matchesOnSale;
    }).toList();
  }

  void clearFilter() {
    filter = ProductsFilter();
  }

  void updateFilter(
      {ProductCategory? category, Collections? collection, bool? onSale}) {
    filter = ProductsFilter(
      category: category ?? filter.category,
      collection: collection ?? filter.collection,
      onSale: onSale ?? filter.onSale,
    );
  }
}
