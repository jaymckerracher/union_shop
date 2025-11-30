import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item_clothing_model.dart';
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

  test('should create CartItemClothing with valid data', () {
    final cartItem = CartItemClothing(
      product: product,
      quantity: 2,
      size: ClothingSize.medium,
      colour: ClothingColour.purple,
    );
    expect(cartItem.product, product);
    expect(cartItem.quantity, 2);
    expect(cartItem.size, ClothingSize.medium);
    expect(cartItem.colour, ClothingColour.purple);
  });

  test('should allow all size and colour enum values', () {
    for (final size in ClothingSize.values) {
      for (final colour in ClothingColour.values) {
        final cartItem = CartItemClothing(
          product: product,
          quantity: 1,
          size: size,
          colour: colour,
        );
        expect(cartItem.size, size);
        expect(cartItem.colour, colour);
      }
    }
  });

  test('should allow quantity of 0', () {
    final cartItem = CartItemClothing(
      product: product,
      quantity: 0,
      size: ClothingSize.xs,
      colour: ClothingColour.black,
    );
    expect(cartItem.quantity, 0);
  });

  test('should allow negative quantity', () {
    final cartItem = CartItemClothing(
      product: product,
      quantity: -3,
      size: ClothingSize.xl,
      colour: ClothingColour.orange,
    );
    expect(cartItem.quantity, -3);
  });
}
