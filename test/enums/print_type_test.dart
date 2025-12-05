import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/enums/print_type.dart';

void main() {
  group('PrintType enum', () {
    test('should contain all expected values', () {
      expect(PrintType.values.length, 3);
      expect(
          PrintType.values,
          containsAll([
            PrintType.oneLine,
            PrintType.twoLines,
            PrintType.threeLines,
          ]));
    });

    test('enum names should match expected strings', () {
      expect(PrintType.oneLine.name, 'oneLine');
      expect(PrintType.twoLines.name, 'twoLines');
      expect(PrintType.threeLines.name, 'threeLines');
    });
  });
}
