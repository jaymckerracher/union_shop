import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/enums/clothing_colour.dart'; // <-- corrected

void main() {
  group('ClothingColour enum', () {
    test('should contain all expected values', () {
      expect(ClothingColour.values.length, 6);
      expect(
          ClothingColour.values,
          containsAll([
            ClothingColour.black,
            ClothingColour.white,
            ClothingColour.purple,
            ClothingColour.grey,
            ClothingColour.green,
            ClothingColour.orange,
          ]));
    });

    test('enum names should match expected strings', () {
      expect(ClothingColour.black.name, 'black');
      expect(ClothingColour.white.name, 'white');
      expect(ClothingColour.purple.name, 'purple');
      expect(ClothingColour.grey.name, 'grey');
      expect(ClothingColour.green.name, 'green');
      expect(ClothingColour.orange.name, 'orange');
    });
  });
}
