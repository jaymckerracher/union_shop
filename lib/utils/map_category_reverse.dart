import '../enums/product_category.dart';

String mapCategory(ProductCategory category) {
  switch (category) {
    case ProductCategory.clothing:
      return 'clothing';
    case ProductCategory.merchandise:
      return 'merchandise';
    default:
      return '';
  }
}
