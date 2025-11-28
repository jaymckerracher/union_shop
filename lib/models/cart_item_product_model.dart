import 'product_model.dart';

class CartItemProduct {
  final Product product;
  final int quantity;

  CartItemProduct({
    required this.product,
    required this.quantity,
  });
}
