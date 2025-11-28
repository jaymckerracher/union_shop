enum ProductCategory {
  clothing,
  merchandise,
}

enum Collections {
  halloween,
  signatureAndEssentialRange,
  portsmouthCityCollection,
  prideCollection,
  graduation,
}

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> imageUrls;
  final double? originalPrice;
  final String? promoMessage;
  final ProductCategory category;
  final List<Collections> collections;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrls,
    required this.category,
    required this.collections,
    this.originalPrice,
    this.promoMessage,
  }) : assert(imageUrls.isNotEmpty, 'Product must have at least one image URL');

  bool get onSale => originalPrice != null;
}
