import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/print_model.dart';

void main() {
  group('Print', () {
    test('creates Print with one line', () {
      final print = Print(type: PrintType.oneLine, lines: ['Line 1']);
      expect(print.type, PrintType.oneLine);
      expect(print.lines, ['Line 1']);
      expect(print.price, 5.0);
    });

    test('creates Print with two lines', () {
      final print = Print(type: PrintType.twoLines, lines: ['A', 'B']);
      expect(print.type, PrintType.twoLines);
      expect(print.lines, ['A', 'B']);
      expect(print.price, 7.0);
    });

    test('creates Print with three lines', () {
      final print = Print(type: PrintType.threeLines, lines: ['X', 'Y', 'Z']);
      expect(print.type, PrintType.threeLines);
      expect(print.lines, ['X', 'Y', 'Z']);
      expect(print.price, 9.0);
    });

    test('allows empty lines list (not recommended)', () {
      final print = Print(type: PrintType.oneLine, lines: []);
      expect(print.lines, isEmpty);
    });
  });
}
