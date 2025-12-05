import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item_merch_model.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/enums/collection.dart';
import 'package:union_shop/enums/product_category.dart';

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

  test('toMap should return correct map', () {
    final cartItem = CartItemMerch(product: product, quantity: 2);
    final map = cartItem.toMap();
    expect(map['product'], isA<Map<String, dynamic>>());
    expect(map['quantity'], 2);
    expect(map['product']['id'], '1');
    expect(map['product']['title'], 'Test Product');
  });

  test('fromMap should create correct CartItemMerch', () {
    final map = {
      'product': {
        'id': '1',
        'title': 'Test Product',
        'description': 'A product for testing',
        'price': 9.99,
        'imageUrls': ['http://example.com/image.png'],
        'category': 'clothing',
        'collections': ['halloween'],
      },
      'quantity': 3,
    };
    final cartItem = CartItemMerch.fromMap(map);
    expect(cartItem.product.id, '1');
    expect(cartItem.product.title, 'Test Product');
    expect(cartItem.quantity, 3);
  });
}
