import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header.dart';
import 'footer.dart';
import '../view_models/cart_view_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get cart products from the view model (not used yet)
    final cartViewModel = Provider.of<CartViewModel>(context);
    final merchItems = cartViewModel.getMerchItems;
    final clothingItems = cartViewModel.getClothingItems;
    final printItems = cartViewModel.getPrintItems;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Header(),
            const SizedBox(height: 48),
            const Center(
              child: Text(
                'Cart',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            // Clothes sub cart heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Text(
                'Clothes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            // List of clothing items as cards
            ...clothingItems.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 6.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.product.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 4),
                                Text('Size: ${item.size.name}'),
                                Text('Colour: ${item.colour.name}'),
                              ],
                            ),
                          ),
                          Text('x${item.quantity}',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 48),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
