import '../models/product_model.dart';

class ProductsRepository {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Sample Product',
      description: 'This is a sample product.',
      price: 9.99,
      imageUrl: 'https://example.com/sample.png',
    ),
  ];
}
