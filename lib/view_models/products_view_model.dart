import '../repositories/products_repository.dart';
import '../models/product_model.dart';

class ProductsViewModel {
  final ProductsRepository _repository = ProductsRepository();
  late List<Product> products;

  ProductsViewModel() {
    products = List<Product>.from(_repository.products);
  }
}
