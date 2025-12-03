import '../enums/clothing_size.dart';
import '../enums/clothing_colour.dart';
import '../models/product_model.dart';

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
