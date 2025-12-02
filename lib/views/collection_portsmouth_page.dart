import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'display_collection.dart';
import 'app_drawer.dart';
import '../view_models/products_view_model.dart';
import 'header.dart';
import 'footer.dart';
import 'filter_sort_menu_bar.dart';
import '../enums/collection.dart';

class CollectionPortsmouthPage extends StatelessWidget {
  const CollectionPortsmouthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ProductsViewModel(collection: Collections.portsmouthCityCollection),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<ProductsViewModel>(
            builder: (context, viewModel, _) => Column(
              children: [
                const Header(),
                const SizedBox(height: 16),
                const Text(
                  'Portsmouth Collection',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222222),
                  ),
                ),
                const SizedBox(height: 8),
                FilterSortMenuBar(
                  viewModel: viewModel,
                  allCollections: false,
                  allCategories: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${viewModel.getProducts.length} products',
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF555555),
                      ),
                    ),
                  ),
                ),
                DisplayCollection(products: viewModel.getProducts),
                const Footer(),
              ],
            ),
          ),
        ),
        drawer: const AppDrawer(),
      ),
    );
  }
}
