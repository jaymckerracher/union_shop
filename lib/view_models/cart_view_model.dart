import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      _merchSubCart.removeAt(index);
      notifyListeners();
    }
  }

  void removeClothingItem(CartItemClothing itemToRemove) {
    final index = _clothingSubCart.indexWhere((item) =>
        item.product.id == itemToRemove.product.id &&
        item.size == itemToRemove.size &&
        item.colour == itemToRemove.colour);
    if (index != -1) {
      _clothingSubCart.removeAt(index);
      notifyListeners();
    }
  }

  void removePrintItem(CartItemPrint itemToRemove) {
    final index =
        _printSubCart.indexWhere((item) => item.id == itemToRemove.id);
    if (index != -1) {
      _printSubCart.removeAt(index);
      notifyListeners();
    }
  }

  double get merchSubCartPrice {
    return _merchSubCart.fold(0.0,
        (currentSum, item) => currentSum + item.product.price * item.quantity);
  }

  double get clothingSubCartPrice {
    return _clothingSubCart.fold(0.0,
        (currentSum, item) => currentSum + item.product.price * item.quantity);
  }

  double get printSubCartPrice {
    return _printSubCart.fold(0.0,
        (currentSum, item) => currentSum + item.print.price * item.quantity);
  }

  double get totalCartPrice {
    return merchSubCartPrice + clothingSubCartPrice + printSubCartPrice;
  }

  void clearCart() {
    _merchSubCart.clear();
    _clothingSubCart.clear();
    _printSubCart.clear();
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {
      'merch': _merchSubCart.map((item) => item.toMap()).toList(),
      'clothing': _clothingSubCart.map((item) => item.toMap()).toList(),
      'print': _printSubCart.map((item) => item.toMap()).toList(),
    };
  }

  Future<void> saveCartToFirebase(String userId) async {
    final cartMap = toMap();
    await FirebaseFirestore.instance
        .collection('carts')
        .doc(userId)
        .set(cartMap);
  }

  Future<void> loadCartFromFirebase(String userId) async {
    final doc =
        await FirebaseFirestore.instance.collection('carts').doc(userId).get();
    if (!doc.exists) return;
    final data = doc.data()!;

    // Clear current cart
    _merchSubCart.clear();
    _clothingSubCart.clear();
    _printSubCart.clear();

    // Merch
    if (data['merch'] != null) {
      for (final item in data['merch']) {
        _merchSubCart
            .add(CartItemMerch.fromMap(Map<String, dynamic>.from(item)));
      }
    }
    // Clothing
    if (data['clothing'] != null) {
      for (final item in data['clothing']) {
        _clothingSubCart
            .add(CartItemClothing.fromMap(Map<String, dynamic>.from(item)));
      }
    }
    // Print
    if (data['print'] != null) {
      for (final item in data['print']) {
        _printSubCart
            .add(CartItemPrint.fromMap(Map<String, dynamic>.from(item)));
      }
    }
    notifyListeners();
  }
}
