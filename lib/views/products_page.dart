import 'package:flutter/material.dart';
import 'display_collection.dart';
import 'app_drawer.dart';
import '../view_models/products_view_model.dart';
import 'header.dart';
import 'footer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ProductsViewModel();
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(child: DisplayCollection(products: viewModel.getProducts)),
          const Footer(),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}
