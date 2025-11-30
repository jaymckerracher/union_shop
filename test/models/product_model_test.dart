import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/enums/collection.dart';
import 'package:union_shop/enums/product_category.dart';

void main() {
  group('Product Model', () {
    test('should create a Product with required fields', () {
      final product = Product(
        id: '1',
        title: 'Test Product',
        description: 'A product for testing',
        price: 9.99,
        imageUrls: ['http://example.com/image.png'],
        category: ProductCategory.clothing,
        collections: [Collections.halloween],
      );

      expect(product.id, '1');
      expect(product.title, 'Test Product');
      expect(product.description, 'A product for testing');
      expect(product.price, 9.99);
      expect(product.imageUrls, ['http://example.com/image.png']);
      expect(product.category, ProductCategory.clothing);
      expect(product.collections, [Collections.halloween]);
      expect(product.originalPrice, isNull);
      expect(product.promoMessage, isNull);
      expect(product.onSale, isFalse);
    });

    test('should create a Product with optional fields', () {
      final product = Product(
        id: '2',
        title: 'Sale Product',
        description: 'A product on sale',
        price: 5.99,
        imageUrls: ['http://example.com/sale.png'],
        category: ProductCategory.merchandise,
        collections: [
          Collections.signatureAndEssentialRange,
          Collections.graduation
        ],
        originalPrice: 10.99,
        promoMessage: '50% OFF!',
      );

      expect(product.originalPrice, 10.99);
      expect(product.promoMessage, '50% OFF!');
      expect(product.category, ProductCategory.merchandise);
      expect(product.collections,
          contains(Collections.signatureAndEssentialRange));
      expect(product.collections, contains(Collections.graduation));
      expect(product.onSale, isTrue);
    });

    test('onSale should be false when originalPrice is null', () {
      final product = Product(
        id: '3',
        title: 'Regular Product',
        description: 'No sale',
        price: 7.99,
        imageUrls: ['http://example.com/regular.png'],
        category: ProductCategory.clothing,
        collections: [Collections.prideCollection],
      );

      expect(product.onSale, isFalse);
    });

    test('onSale should be true when originalPrice is set', () {
      final product = Product(
        id: '4',
        title: 'Discounted Product',
        description: 'Discounted',
        price: 4.99,
        imageUrls: ['http://example.com/discount.png'],
        category: ProductCategory.merchandise,
        collections: [Collections.portsmouthCityCollection],
        originalPrice: 8.99,
      );

      expect(product.onSale, isTrue);
    });

    test('should throw AssertionError if imageUrls is empty', () {
      expect(
        () => Product(
          id: '7',
          title: 'No Image Product',
          description: 'Should fail',
          price: 1.99,
          imageUrls: [],
          category: ProductCategory.clothing,
          collections: [Collections.halloween],
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should allow multiple collections', () {
      final product = Product(
        id: '8',
        title: 'Multi Collection Product',
        description: 'Product in multiple collections',
        price: 12.99,
        imageUrls: ['http://example.com/multi.png'],
        category: ProductCategory.merchandise,
        collections: [
          Collections.halloween,
          Collections.graduation,
          Collections.prideCollection
        ],
      );
      expect(product.collections.length, 3);
      expect(
          product.collections,
          containsAll([
            Collections.halloween,
            Collections.graduation,
            Collections.prideCollection
          ]));
    });
  });
}
