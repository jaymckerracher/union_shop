import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item_model.dart';
import 'package:union_shop/models/product_model.dart';

void main() {
  final product = Product(
    id: '1',
    title: 'Test Product',
    description: 'A product for testing',
    price: 9.99,
    imageUrls: ['http://example.com/image.png'],
  );

  test('should create a CartItem with valid data', () {
    final cartItem = CartItem(product: product, value: 2);
    expect(cartItem.product, product);
    expect(cartItem.value, 2);
  });

  test('should allow value of 0', () {
    final cartItem = CartItem(product: product, value: 0);
    expect(cartItem.value, 0);
  });

  test('should allow negative value', () {
    final cartItem = CartItem(product: product, value: -5);
    expect(cartItem.value, -5);
  });
}
