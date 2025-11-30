import '../models/cart_item_merch_model.dart';

class CartViewModel {
  final List<CartItemMerch> _items = [];

  List<CartItemMerch> get items => List.unmodifiable(_items);

  void addItem(CartItemMerch newItem) {
    final index =
        _items.indexWhere((item) => item.product.id == newItem.product.id);
    if (index != -1) {
      final existing = _items[index];
      _items[index] = CartItemMerch(
        product: existing.product,
        quantity: existing.quantity + newItem.quantity,
      );
    } else {
      _items.add(newItem);
    }
  }

  void removeItem(CartItemMerch itemToRemove) {
    final index =
        _items.indexWhere((item) => item.product.id == itemToRemove.product.id);
    if (index != -1) {
      final existing = _items[index];
      if (existing.quantity > 1) {
        _items[index] = CartItemMerch(
          product: existing.product,
          quantity: existing.quantity - 1,
        );
      } else {
        _items.removeAt(index);
      }
    }
  }

  double get totalPrice {
    return _items.fold(
        0.0, (sum, item) => sum + item.product.price * item.quantity);
  }
}
