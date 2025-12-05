import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/enums/clothing_size.dart';

void main() {
  group('ClothingSize enum', () {
    test('should contain all expected values', () {
      // Update this list to match your actual enum values
      expect(
          ClothingSize.values,
          containsAll([
            ClothingSize.xs,
            ClothingSize.small,
            ClothingSize.medium,
            ClothingSize.large,
            ClothingSize.xl,
          ]));
    });
  });
}
