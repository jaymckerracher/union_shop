import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item_print_model.dart';
import 'package:union_shop/models/print_model.dart';

void main() {
  group('CartItemPrint', () {
    test('creates CartItemPrint with one line print and id', () {
      final print = Print(type: PrintType.oneLine, lines: ['Line 1']);
      final cartItem = CartItemPrint(id: 'id-1', print: print, quantity: 1);
      expect(cartItem.id, 'id-1');
      expect(cartItem.print, print);
      expect(cartItem.quantity, 1);
      expect(cartItem.print.type, PrintType.oneLine);
      expect(cartItem.print.lines, ['Line 1']);
      expect(cartItem.print.price, 5.0);
    });

    test('creates CartItemPrint with two lines print and id', () {
      final print = Print(type: PrintType.twoLines, lines: ['A', 'B']);
      final cartItem = CartItemPrint(id: 'id-2', print: print, quantity: 2);
      expect(cartItem.id, 'id-2');
      expect(cartItem.print.type, PrintType.twoLines);
      expect(cartItem.print.lines, ['A', 'B']);
      expect(cartItem.print.price, 7.0);
    });

    test('creates CartItemPrint with three lines print and id', () {
      final print = Print(type: PrintType.threeLines, lines: ['X', 'Y', 'Z']);
      final cartItem = CartItemPrint(id: 'id-3', print: print, quantity: 3);
      expect(cartItem.id, 'id-3');
      expect(cartItem.print.type, PrintType.threeLines);
      expect(cartItem.print.lines, ['X', 'Y', 'Z']);
      expect(cartItem.print.price, 9.0);
    });

    test('allows quantity of 0', () {
      final print = Print(type: PrintType.oneLine, lines: ['Line 1']);
      final cartItem = CartItemPrint(id: 'id-4', print: print, quantity: 0);
      expect(cartItem.id, 'id-4');
      expect(cartItem.quantity, 0);
    });

    test('allows negative quantity', () {
      final print = Print(type: PrintType.oneLine, lines: ['Line 1']);
      final cartItem = CartItemPrint(id: 'id-5', print: print, quantity: -2);
      expect(cartItem.id, 'id-5');
      expect(cartItem.quantity, -2);
    });

    test('unique ids for different CartItemPrints', () {
      final print1 = Print(type: PrintType.oneLine, lines: ['A']);
      final print2 = Print(type: PrintType.oneLine, lines: ['B']);
      final cartItem1 =
          CartItemPrint(id: 'unique-1', print: print1, quantity: 1);
      final cartItem2 =
          CartItemPrint(id: 'unique-2', print: print2, quantity: 1);
      expect(cartItem1.id, isNot(cartItem2.id));
    });
  });
}
