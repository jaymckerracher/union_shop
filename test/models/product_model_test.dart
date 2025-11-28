import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product_model.dart';

void main() {
  group('Product Model', () {
    test('should create a Product with required fields', () {
      final product = Product(
        id: '1',
        title: 'Test Product',
        description: 'A product for testing',
        price: 9.99,
        imageUrls: ['http://example.com/image.png'],
      );

      expect(product.id, '1');
      expect(product.title, 'Test Product');
      expect(product.description, 'A product for testing');
      expect(product.price, 9.99);
      expect(product.imageUrls, ['http://example.com/image.png']);
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
        originalPrice: 10.99,
        promoMessage: '50% OFF!',
      );

      expect(product.originalPrice, 10.99);
      expect(product.promoMessage, '50% OFF!');
      expect(product.onSale, isTrue);
    });

    test('onSale should be false when originalPrice is null', () {
      final product = Product(
        id: '3',
        title: 'Regular Product',
        description: 'No sale',
        price: 7.99,
        imageUrls: ['http://example.com/regular.png'],
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
        originalPrice: 8.99,
      );

      expect(product.onSale, isTrue);
    });
  });
}
