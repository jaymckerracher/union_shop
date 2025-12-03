import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header.dart';
import 'footer.dart';
import '../view_models/cart_view_model.dart';
import 'cart_clothing_card.dart';
import 'cart_merch_card.dart';
import 'cart_print_card.dart';

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
            // List of clothing items styled like the provided image, or empty message
            clothingItems.isEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(
                      child: Text('No items available',
                          style:
                              TextStyle(fontSize: 16, color: Colors.black54)),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300, width: 2),
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                    ),
                    child: Column(
                      children: [
                        ...clothingItems
                            .map((item) => CartClothingCard(item: item)),
                      ],
                    ),
                  ),
            // Merch sub cart heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Text(
                'Merch',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            // List of merch items styled like the provided image, or empty message
            merchItems.isEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(
                      child: Text('No items available',
                          style:
                              TextStyle(fontSize: 16, color: Colors.black54)),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300, width: 2),
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                    ),
                    child: Column(
                      children: [
                        ...merchItems.map((item) => CartMerchCard(item: item)),
                      ],
                    ),
                  ),
            // Prints sub cart heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Text(
                'Prints',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            // List of print items styled like the provided image, or empty message
            printItems.isEmpty
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(
                      child: Text('No items available',
                          style:
                              TextStyle(fontSize: 16, color: Colors.black54)),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300, width: 2),
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                    ),
                    child: Column(
                      children: [
                        ...printItems.map((item) => CartPrintCard(item: item)),
                      ],
                    ),
                  ),
            const SizedBox(height: 48),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
