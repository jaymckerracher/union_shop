import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import 'app_drawer.dart';
import '../view_models/products_view_model.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productsViewModel = ProductsViewModel();
    final product = productsViewModel.getProductById(productId);

    // Use a StatefulBuilder to manage selectedImageIndex locally
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            // Product details
            if (product == null)
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(24),
                child: const Text(
                  'Product not found.',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            else
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(24),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    int selectedImageIndex = 0;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: (product.imageUrls.isNotEmpty &&
                                    product.imageUrls[selectedImageIndex]
                                        .isNotEmpty)
                                ? Image.asset(
                                    product.imageUrls[selectedImageIndex],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: const Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.image_not_supported,
                                                size: 64,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Image unavailable',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image_not_supported,
                                            size: 64,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Image unavailable',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),

                        // Thumbnails row
                        if (product.imageUrls.length > 1)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(product.imageUrls.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedImageIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    padding: EdgeInsets.all(
                                        selectedImageIndex == index ? 3 : 0),
                                    decoration: BoxDecoration(
                                      border: selectedImageIndex == index
                                          ? Border.all(
                                              color: Colors.black, width: 2)
                                          : null,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        product.imageUrls[index],
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),

                        const SizedBox(height: 24),

                        // Product name
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Product price
                        Text(
                          '£${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4d2963),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Product description
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
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
