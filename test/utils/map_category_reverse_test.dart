import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_category_reverse.dart';
import 'package:union_shop/enums/product_category.dart';

void main() {
  test('mapCategoryReverse returns "all" for null', () {
    expect(mapCategoryReverse(null), 'all');
  });

  test('mapCategoryReverse returns "clothing" for ProductCategory.clothing',
      () {
    expect(mapCategoryReverse(ProductCategory.clothing), 'clothing');
  });

  test(
      'mapCategoryReverse returns "merchandise" for ProductCategory.merchandise',
      () {
    expect(mapCategoryReverse(ProductCategory.merchandise), 'merchandise');
  });
}
