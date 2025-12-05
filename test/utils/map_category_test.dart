import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_category.dart';
import 'package:union_shop/enums/product_category.dart';

void main() {
  test('mapCategory returns ProductCategory.clothing for "clothing"', () {
    expect(mapCategory('clothing'), ProductCategory.clothing);
  });

  test('mapCategory returns ProductCategory.merchandise for "merchandise"', () {
    expect(mapCategory('merchandise'), ProductCategory.merchandise);
  });

  test(
      'mapCategory returns ProductCategory.clothing for "ClOtHiNg" (case insensitive)',
      () {
    expect(mapCategory('ClOtHiNg'), ProductCategory.clothing);
  });

  test('mapCategory returns null for unknown category', () {
    expect(mapCategory('unknown'), isNull);
  });
}
