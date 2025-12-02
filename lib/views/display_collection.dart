import 'package:flutter/material.dart';
import '../utils/navigation.dart';

class DisplayCollection extends StatelessWidget {
  final List products;
  const DisplayCollection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final minHeight =
        MediaQuery.of(context).size.height * 0.4; // adjust as needed
    if (products.isEmpty) {
      return Container(
        constraints: BoxConstraints(minHeight: minHeight),
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: Text(
            'No products found.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 8.0, bottom: 32.0, top: 16.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
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
        ),
      ),
    );
  }
}
