import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/enums/product_category.dart';

void main() {
  group('ProductCategory enum', () {
    test('should contain all expected values', () {
      expect(ProductCategory.values.length, 2);
      expect(
          ProductCategory.values,
          containsAll([
            ProductCategory.clothing,
            ProductCategory.merchandise,
          ]));
    });

    test('enum names should match expected strings', () {
      expect(ProductCategory.clothing.name, 'clothing');
      expect(ProductCategory.merchandise.name, 'merchandise');
    });
  });
}
