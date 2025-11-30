import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item_merch_model.dart';
import 'package:union_shop/models/product_model.dart';

void main() {
  final product = Product(
    id: '1',
    title: 'Test Product',
    description: 'A product for testing',
    price: 9.99,
    imageUrls: ['http://example.com/image.png'],
    category: ProductCategory.clothing,
    collections: [Collections.halloween],
  );

  test('should create a CartItem with valid data', () {
    final cartItem = CartItemMerch(product: product, quantity: 2);
    expect(cartItem.product, product);
    expect(cartItem.quantity, 2);
  });

  test('should allow value of 0', () {
    final cartItem = CartItemMerch(product: product, quantity: 0);
    expect(cartItem.quantity, 0);
  });

  test('should allow negative value', () {
    final cartItem = CartItemMerch(product: product, quantity: -5);
    expect(cartItem.quantity, -5);
  });
}
