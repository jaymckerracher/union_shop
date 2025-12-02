import 'package:flutter/material.dart';
import '../view_models/products_view_model.dart';
import '../utils/map_range_to_collection.dart';
import '../utils/map_category.dart';
import '../utils/navigation.dart';
import 'header.dart';
import 'footer.dart';

class DisplayCollection extends StatelessWidget {
  String _getCollectionTitle(String filter) {
    switch (filter.toLowerCase()) {
      case 'halloween':
        return 'Halloween Collection';
      case 'essential':
        return 'Signature & Essential Collection';
      case 'pride':
        return 'Pride Collection';
      case 'portsmouth':
        return 'Portsmouth City Collection';
      case 'graduation':
        return 'Graduation Collection';
      case 'clothing':
        return 'Clothing';
      case 'merchandise':
        return 'Merchandise';
      case 'sale':
        return 'Products On Sale';
      case 'all':
        return 'All Products';
      default:
        return 'Collection';
    }
  }

  final String filter;
  const DisplayCollection({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    final viewModel = ProductsViewModel();

    if (filter == "clothing" || filter == "merchandise") {
      final collection = mapCategory(filter);
      viewModel.updateFilter(category: collection);
    } else if (filter == 'sale') {
      viewModel.updateFilter(onSale: true);
    } else if (filter != 'all') {
      final collection = mapRangeToCollection(filter);
      viewModel.updateFilter(collection: collection);
    }

    final products = viewModel.getProducts;

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Header(),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
            child: Text(
              _getCollectionTitle(filter),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF444950),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '${products.length} product(s)',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 32.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = products[index];
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      onTap: () {
                        navigateToProduct(context, product.id);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                product.imageUrls.first,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF444950),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              if (product.originalPrice != null)
                                Text(
                                  '£${product.originalPrice!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              if (product.originalPrice != null)
                                const SizedBox(width: 6),
                              Text(
                                '£${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: product.originalPrice != null
                                      ? const Color(0xFF4d2963)
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              childCount: products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Footer(),
        ),
      ],
    );
  }
}
