import '../enums/product_category.dart';

ProductCategory? mapCategory(String category) {
  switch (category.toLowerCase()) {
    case 'clothing':
      return ProductCategory.clothing;
    case 'merchandise':
      return ProductCategory.merchandise;
    default:
      return null;
  }
}
