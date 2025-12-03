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

    // Build a list of widgets for the grid
    List<Widget> collectionTiles = [];
    for (final product in firstProducts) {
      // For each collection this product represents (could be more than one, but only the first per collection is in the list)
      for (final collection in product.collections) {
        // Only add the tile if this product is the first for this collection
        if (firstProducts.indexOf(product) ==
            firstProducts
                .indexWhere((p) => p.collections.contains(collection))) {
          collectionTiles.add(
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Product image
                    product.imageUrls.isNotEmpty
                        ? Image.asset(
                            product.imageUrls[0],
                            fit: BoxFit.cover,
                          )
                        : Container(color: Colors.grey[300]),
                    // Overlay with collection name
                    Container(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.35),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          collection.name.replaceAll('_', ' '),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
    }

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // 2 per row, centered
                  double tileWidth = (constraints.maxWidth - 24) / 2;
                  int rowCount = (collectionTiles.length / 2).ceil();
                  return Column(
                    children: List.generate(rowCount, (row) {
                      final start = row * 2;
                      final end = (start + 2).clamp(0, collectionTiles.length);
                      final rowTiles = collectionTiles.sublist(start, end);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: rowTiles
                            .map((tile) =>
                                SizedBox(width: tileWidth, child: tile))
                            .toList(),
                      );
                    }),
                  );
                },
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
