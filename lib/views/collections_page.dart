import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import './app_drawer.dart';
import '../view_models/products_view_model.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of ProductsViewModel
    final productsViewModel = ProductsViewModel();
    // Get a list of the first product from each collection
    final firstProducts = productsViewModel.firstProductInEachCollection;

    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Header(),
            const SizedBox(height: 48),
            const Center(
              child: Text(
                'Collections',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 48),
            // Example: print product titles (for demonstration)
            ...firstProducts.map((product) => ListTile(
                  title: Text(product.title),
                )),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
