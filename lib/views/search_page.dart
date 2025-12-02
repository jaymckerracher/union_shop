import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header.dart';
import 'footer.dart';
import './app_drawer.dart';
import '../view_models/products_view_model.dart';
import 'display_collection.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsViewModel(),
      child: Scaffold(
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Consumer<ProductsViewModel>(
                  builder: (context, viewModel, _) => TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (value) {
                      viewModel.updateFilter(query: value);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Consumer<ProductsViewModel>(
                builder: (context, viewModel, _) {
                  final products = viewModel.getProducts;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          '${products.length} products',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DisplayCollection(products: products),
                    ],
                  );
                },
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
