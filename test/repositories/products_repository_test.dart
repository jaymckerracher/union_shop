import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/products_repository.dart';
import 'package:union_shop/enums/collection.dart';
import 'package:union_shop/enums/product_category.dart';

void main() {
  final repo = ProductsRepository();

  test('should contain 20 products', () {
    expect(repo.products.length, 20);
  });

  test('all products should have required fields', () {
    for (final product in repo.products) {
      expect(product.id, isNotEmpty);
      expect(product.title, isNotEmpty);
      expect(product.description, isNotEmpty);
      expect(product.price, greaterThan(0));
      expect(product.imageUrls, isNotEmpty);
      expect(product.category, isA<ProductCategory>());
      expect(product.collections, isA<List<Collections>>());
    }
  });

  test('sale products should have originalPrice and promoMessage', () {
    final saleProducts = repo.products.where((p) => p.originalPrice != null);
    for (final product in saleProducts) {
      expect(product.promoMessage, isNotNull);
      expect(product.originalPrice, greaterThan(product.price));
    }
  });

  test('no product should have a negative price', () {
    for (final product in repo.products) {
      expect(product.price, isNonNegative);
    }
  });
}
