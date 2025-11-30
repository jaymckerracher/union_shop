import 'product_model.dart';

enum ClothingSize {
  xs,
  small,
  medium,
  large,
  xl,
}

enum ClothingColour {
  black,
  white,
  purple,
  grey,
  green,
  orange,
}

class CartItemClothing {
  final Product product;
  final int quantity;
  final ClothingSize size;
  final ClothingColour colour;

  CartItemClothing({
    required this.product,
    required this.quantity,
    required this.size,
    required this.colour,
  });
}
