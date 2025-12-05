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

    test('initial subcarts are empty and prices are zero', () {
      expect(cart.getMerchItems, isEmpty);
      expect(cart.getClothingItems, isEmpty);
      expect(cart.getPrintItems, isEmpty);
      expect(cart.merchSubCartPrice, 0.0);
      expect(cart.clothingSubCartPrice, 0.0);
      expect(cart.printSubCartPrice, 0.0);
      expect(cart.totalCartPrice, 0.0);
    });

    test('addMerchItem adds and sums price', () {
      cart.addMerchItem(merchItem(quantity: 2), 'testuser');
      expect(cart.getMerchItems.length, 1);
      expect(cart.getMerchItems.first.quantity, 2);
      expect(cart.merchSubCartPrice, 20.0);
    });

    test('clearCart on already empty cart does not throw', () {
      expect(cart.getMerchItems, isEmpty);
      expect(cart.getClothingItems, isEmpty);
      expect(cart.getPrintItems, isEmpty);
      cart.clearCart();
      expect(cart.getMerchItems, isEmpty);
      expect(cart.getClothingItems, isEmpty);
      expect(cart.getPrintItems, isEmpty);
    });
  });
}
