import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header.dart';
import 'footer.dart';
import '../view_models/cart_view_model.dart';
import 'cart_clothing_card.dart';
import 'cart_merch_card.dart';
import 'cart_print_card.dart';
import './app_drawer.dart';
import 'cart_go_home_overlay.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _showPurchaseSuccessOverlay() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const CartGoHomeOverlay(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    final merchItems = cartViewModel.getMerchItems;
    final clothingItems = cartViewModel.getClothingItems;
    final printItems = cartViewModel.getPrintItems;

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
            // Total price and checkout button
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '£${cartViewModel.totalCartPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showPurchaseSuccessOverlay,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Checkout'),
                ),
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
