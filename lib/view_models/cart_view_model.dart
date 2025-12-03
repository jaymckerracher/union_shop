import 'package:flutter/foundation.dart';
import '../models/cart_item_merch_model.dart';
import '../models/cart_item_clothing_model.dart';
import '../models/cart_item_print_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItemMerch> _merchSubCart = [];
  final List<CartItemClothing> _clothingSubCart = [];
  final List<CartItemPrint> _printSubCart = [];

  List<CartItemMerch> get getMerchItems => List.unmodifiable(_merchSubCart);
  List<CartItemClothing> get getClothingItems =>
      List.unmodifiable(_clothingSubCart);
  List<CartItemPrint> get getPrintItems => List.unmodifiable(_printSubCart);

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

  void addClothingItem(CartItemClothing newItem) {
    final index = _clothingSubCart.indexWhere((item) =>
        item.product.id == newItem.product.id &&
        item.size == newItem.size &&
        item.colour == newItem.colour);
    if (index != -1) {
      final existing = _clothingSubCart[index];
      _clothingSubCart[index] = CartItemClothing(
        product: existing.product,
        quantity: existing.quantity + newItem.quantity,
        size: existing.size,
        colour: existing.colour,
      );
    } else {
      _clothingSubCart.add(newItem);
    }
    notifyListeners();
  }

  void addPrintItem(CartItemPrint newItem) {
    final index = _printSubCart.indexWhere((item) => item.id == newItem.id);
    if (index != -1) {
      final existing = _printSubCart[index];
      _printSubCart[index] = CartItemPrint(
        id: existing.id,
        print: existing.print,
        quantity: existing.quantity + newItem.quantity,
      );
    } else {
      _printSubCart.add(newItem);
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

  void removeClothingItem(CartItemClothing itemToRemove) {
    final index = _clothingSubCart.indexWhere((item) =>
        item.product.id == itemToRemove.product.id &&
        item.size == itemToRemove.size &&
        item.colour == itemToRemove.colour);
    if (index != -1) {
      final existing = _clothingSubCart[index];
      if (existing.quantity > 1) {
        _clothingSubCart[index] = CartItemClothing(
          product: existing.product,
          quantity: existing.quantity - 1,
          size: existing.size,
          colour: existing.colour,
        );
      } else {
        _clothingSubCart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removePrintItem(CartItemPrint itemToRemove) {
    final index =
        _printSubCart.indexWhere((item) => item.id == itemToRemove.id);
    if (index != -1) {
      final existing = _printSubCart[index];
      if (existing.quantity > 1) {
        _printSubCart[index] = CartItemPrint(
          id: existing.id,
          print: existing.print,
          quantity: existing.quantity - 1,
        );
      } else {
        _printSubCart.removeAt(index);
      }
      notifyListeners();
    }
  }

  double get merchSubCartPrice {
    return _merchSubCart.fold(
        0.0, (sum, item) => sum + item.product.price * item.quantity);
  }

  double get clothingSubCartPrice {
    return _clothingSubCart.fold(
        0.0, (sum, item) => sum + item.product.price * item.quantity);
  }

  double get printSubCartPrice {
    return _printSubCart.fold(
        0.0, (sum, item) => sum + item.print.price * item.quantity);
  }

  double get totalCartPrice {
    return merchSubCartPrice + clothingSubCartPrice + printSubCartPrice;
  }
}
