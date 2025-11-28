import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item_print_model.dart';
import 'package:union_shop/models/print_model.dart';

void main() {
  group('CartItemPrint', () {
    test('creates CartItemPrint with one line print', () {
      final print = Print(type: PrintType.oneLine, lines: ['Line 1']);
      final cartItem = CartItemPrint(print: print, quantity: 1);
      expect(cartItem.print, print);
      expect(cartItem.quantity, 1);
      expect(cartItem.print.type, PrintType.oneLine);
      expect(cartItem.print.lines, ['Line 1']);
      expect(cartItem.print.price, 5.0);
    });

    test('creates CartItemPrint with two lines print', () {
      final print = Print(type: PrintType.twoLines, lines: ['A', 'B']);
      final cartItem = CartItemPrint(print: print, quantity: 2);
      expect(cartItem.print.type, PrintType.twoLines);
      expect(cartItem.print.lines, ['A', 'B']);
      expect(cartItem.print.price, 7.0);
    });

    test('creates CartItemPrint with three lines print', () {
      final print = Print(type: PrintType.threeLines, lines: ['X', 'Y', 'Z']);
      final cartItem = CartItemPrint(print: print, quantity: 3);
      expect(cartItem.print.type, PrintType.threeLines);
      expect(cartItem.print.lines, ['X', 'Y', 'Z']);
      expect(cartItem.print.price, 9.0);
    });

    test('allows quantity of 0', () {
      final print = Print(type: PrintType.oneLine, lines: ['Line 1']);
      final cartItem = CartItemPrint(print: print, quantity: 0);
      expect(cartItem.quantity, 0);
    });

    test('allows negative quantity', () {
      final print = Print(type: PrintType.oneLine, lines: ['Line 1']);
      final cartItem = CartItemPrint(print: print, quantity: -2);
      expect(cartItem.quantity, -2);
    });
  });
}
