import '../enums/collection.dart';
import '../enums/product_category.dart';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrls': imageUrls,
      'originalPrice': originalPrice,
      'promoMessage': promoMessage,
      'category':
          category.name, // or category.toString() if you want the enum string
      'collections': collections.map((c) => c.name).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      imageUrls: List<String>.from(map['imageUrls']),
      originalPrice: map['originalPrice'] != null
          ? (map['originalPrice'] as num).toDouble()
          : null,
      promoMessage: map['promoMessage'] as String?,
      category: ProductCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => ProductCategory.values.first,
      ),
      collections: (map['collections'] as List)
          .map((c) => Collections.values.firstWhere((e) => e.name == c))
          .toList(),
    );
  }
}
