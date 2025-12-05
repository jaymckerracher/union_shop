import 'print_model.dart';

class CartItemPrint {
  final String id;
  final Print print;
  final int quantity;

  CartItemPrint({
    required this.id,
    required this.print,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'print': print.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItemPrint.fromMap(Map<String, dynamic> map) {
    return CartItemPrint(
      id: map['id'] as String,
      print: Print.fromMap(map['print'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }
}
