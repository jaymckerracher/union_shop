import 'package:flutter/foundation.dart';
import '../models/cart_item_merch_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItemMerch> _merchSubCart = [];

  List<CartItemMerch> get getMerchItems => List.unmodifiable(_merchSubCart);

  void addMerchItem(CartItemMerch newItem) {
    final index = _merchSubCart
        .indexWhere((item) => item.product.id == newItem.product.id);
    if (index != -1) {
      final existing = _merchSubCart[index];
      _merchSubCart[index] = CartItemMerch(
        product: existing.product,
        quantity: existing.quantity + newItem.quantity,
      );
    } else {
      _merchSubCart.add(newItem);
    }
    notifyListeners();
  }

  void removeMerchItem(CartItemMerch itemToRemove) {
    final index = _merchSubCart
        .indexWhere((item) => item.product.id == itemToRemove.product.id);
    if (index != -1) {
      final existing = _merchSubCart[index];
      if (existing.quantity > 1) {
        _merchSubCart[index] = CartItemMerch(
          product: existing.product,
          quantity: existing.quantity - 1,
        );
      } else {
        _merchSubCart.removeAt(index);
      }
      notifyListeners();
    }
  }

  // double get totalPrice {
  //   return _items.fold(
  //       0.0, (sum, item) => sum + item.product.price * item.quantity);
  // }
}
