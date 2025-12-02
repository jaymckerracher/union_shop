import '../enums/product_category.dart';

String mapCategoryReverse(ProductCategory? category) {
  if (category == null) return 'all';

  switch (category) {
    case ProductCategory.clothing:
      return 'clothing';
    case ProductCategory.merchandise:
      return 'merchandise';
  }
}
