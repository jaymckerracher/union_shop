import 'package:flutter/material.dart';
import '../view_models/products_view_model.dart';
import '../enums/collection.dart';

class HomeRangePreview extends StatelessWidget {
  final String range;
  const HomeRangePreview({super.key, required this.range});

  Collections? _mapRangeToCollection(String range) {
    switch (range.toLowerCase()) {
      case 'halloween':
        return Collections.halloween;
      case 'essential':
        return Collections.signatureAndEssentialRange;
      case 'porstmouth':
        return Collections.portsmouthCityCollection;
      case 'pride':
        return Collections.prideCollection;
      case 'graduation':
        return Collections.graduation;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final collection = _mapRangeToCollection(range);
    final viewModel = ProductsViewModel();
    viewModel.updateFilter(collection: collection);

    final products = viewModel.filteredProducts.take(2).toList();

    String capitalizedRange =
        range.isNotEmpty ? range[0].toUpperCase() + range.substring(1) : range;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            capitalizedRange,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4d2963),
            ),
          ),
        ),
        if (products.isNotEmpty)
          ...products.map((product) => Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
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
                    const SizedBox(height: 16),
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444950),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (product.originalPrice != null)
                          Text(
                            '£${product.originalPrice!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (product.originalPrice != null)
                          const SizedBox(width: 8),
                        Text(
                          '£${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {}, // No functionality yet
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text('View All'),
            ),
          ),
        ),
      ],
    );
  }
}
