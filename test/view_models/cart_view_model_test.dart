import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/view_models/cart_view_model.dart';
import 'package:union_shop/models/cart_item_merch_model.dart';
import 'package:union_shop/models/product_model.dart';
import 'package:union_shop/enums/product_category.dart';

void main() {
  // Dummy product for testing
  final product = Product(
    id: '1',
    title: 'Test Product',
    description: 'A product for testing',
    price: 10.0,
    imageUrls: ['test.png'],
    category: ProductCategory.merchandise,
    collections: [],
  );

  CartItemMerch merchItem({int quantity = 1}) =>
      CartItemMerch(product: product, quantity: quantity);

  group('CartViewModel', () {
    late CartViewModel cart;

    setUp(() {
      cart = CartViewModel();
    });

    test('initial cart is empty', () {
      expect(cart.items, isEmpty);
      expect(cart.totalPrice, 0.0);
    });

    test('addItem adds a new item', () {
      cart.addItem(merchItem());
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 1);
    });

    test('addItem increases quantity if item exists', () {
      cart.addItem(merchItem());
      cart.addItem(merchItem(quantity: 2));
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 3);
    });

    test('removeItem decreases quantity', () {
      cart.addItem(merchItem(quantity: 3));
      cart.removeItem(merchItem());
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 2);
    });

    test('removeItem removes item if quantity is 1', () {
      cart.addItem(merchItem());
      cart.removeItem(merchItem());
      expect(cart.items, isEmpty);
    });

    test('totalPrice sums all items', () {
      cart.addItem(merchItem(quantity: 2));
      final product2 = Product(
        id: '2',
        title: 'Another',
        description: 'Another product',
        price: 5.0,
        imageUrls: ['test2.png'],
        category: ProductCategory.merchandise,
        collections: [],
      );
      cart.addItem(CartItemMerch(product: product2, quantity: 3));
      expect(cart.totalPrice, 2 * 10.0 + 3 * 5.0);
    });
  });
}
