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

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
      'size': size.name,
      'colour': colour.name,
    };
  }

  factory CartItemClothing.fromMap(Map<String, dynamic> map) {
    return CartItemClothing(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      size: ClothingSize.values.firstWhere((e) => e.name == map['size']),
      colour: ClothingColour.values.firstWhere((e) => e.name == map['colour']),
    );
  }
}
