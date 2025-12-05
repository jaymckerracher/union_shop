import 'product_model.dart';

class CartItemMerch {
  final Product product;
  final int quantity;

  CartItemMerch({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }
}
