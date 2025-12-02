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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 16),
            const Text(
              'All Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222222),
              ),
            ),
            const SizedBox(height: 8),
            DisplayCollection(products: viewModel.getProducts),
            const Footer(),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
