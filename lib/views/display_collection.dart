import 'package:flutter/material.dart';
import '../view_models/products_view_model.dart';
import '../utils/map_range_to_collection.dart';

class DisplayCollection extends StatelessWidget {
  final String range;
  const DisplayCollection({super.key, required this.range});

  @override
  Widget build(BuildContext context) {
    final collection = mapRangeToCollection(range);
    final viewModel = ProductsViewModel();
    viewModel.updateFilter(collection: collection);
    final products = viewModel.filteredProducts;

    // For now, just return a list of product titles for debugging
    return ListView(
      shrinkWrap: true,
      children: products
          .map((product) => ListTile(title: Text(product.title)))
          .toList(),
    );
  }
}
