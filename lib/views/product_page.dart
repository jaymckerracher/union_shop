import '../utils/firebase_get_user.dart';
import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import 'app_drawer.dart';
import '../view_models/products_view_model.dart';
import '../enums/clothing_size.dart';
import '../enums/clothing_colour.dart';
import 'package:provider/provider.dart';
import '../view_models/cart_view_model.dart';
import '../models/cart_item_clothing_model.dart';
import '../models/cart_item_merch_model.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final productsViewModel = ProductsViewModel();
    final product = productsViewModel.getProductById(productId);

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
                child: ProductDetails(product: product),
              ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ProductDetails extends StatefulWidget {
  final dynamic product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedImageIndex = 0;
  int _quantity = 1;

  ClothingColour? selectedColour;
  ClothingSize? selectedSize;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
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
                    product.imageUrls[selectedImageIndex].isNotEmpty)
                ? Image.asset(
                    product.imageUrls[selectedImageIndex],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_not_supported,
                                size: 64,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Image unavailable',
                                style: TextStyle(color: Colors.grey),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Image unavailable',
                            style: TextStyle(color: Colors.grey),
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
              children: List.generate(product.imageUrls.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding:
                        EdgeInsets.all(selectedImageIndex == index ? 3 : 0),
                    decoration: BoxDecoration(
                      border: selectedImageIndex == index
                          ? Border.all(color: Colors.black, width: 2)
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

        // Clothing options
        if (product.category.toString().toLowerCase().contains('clothing')) ...[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: DropdownButtonFormField<ClothingColour>(
              initialValue: selectedColour ?? ClothingColour.values.first,
              decoration: const InputDecoration(
                labelText: 'Colour',
                border: OutlineInputBorder(),
              ),
              items: ClothingColour.values.map((colour) {
                return DropdownMenuItem<ClothingColour>(
                  value: colour,
                  child: Text(
                      colour.name[0].toUpperCase() + colour.name.substring(1)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedColour = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: DropdownButtonFormField<ClothingSize>(
              initialValue: selectedSize ?? ClothingSize.values[2],
              decoration: const InputDecoration(
                labelText: 'Size',
                border: OutlineInputBorder(),
              ),
              items: ClothingSize.values.map((size) {
                return DropdownMenuItem<ClothingSize>(
                  value: size,
                  child: Text(size.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSize = value;
                });
              },
            ),
          ),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Quantity counter
              Row(
                children: [
                  const Text(
                    'Quantity:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_quantity > 1) _quantity--;
                      });
                    },
                  ),
                  Text(
                    '$_quantity',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                ],
              ),
              // Add to Cart button
              ElevatedButton(
                onPressed: () async {
                  final uid = getCurrentUser()?.uid;
                  if (uid == null) {
                    Navigator.of(context).pushReplacementNamed('/login');
                    return;
                  }
                  final cart =
                      Provider.of<CartViewModel>(context, listen: false);

                  if (product.category
                      .toString()
                      .toLowerCase()
                      .contains('clothing')) {
                    final colour =
                        selectedColour ?? ClothingColour.values.first;
                    final size = selectedSize ?? ClothingSize.values[2];
                    cart.addClothingItem(
                      CartItemClothing(
                        product: product,
                        quantity: _quantity,
                        size: size,
                        colour: colour,
                      ),
                      uid,
                    );
                  } else if (product.category
                      .toString()
                      .toLowerCase()
                      .contains('merch')) {
                    cart.addMerchItem(
                      CartItemMerch(
                        product: product,
                        quantity: _quantity,
                      ),
                      uid,
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to cart!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
