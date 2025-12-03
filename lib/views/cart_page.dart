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

    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 48),
            Center(
              child: Text(
                'Cart',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 48),
            Footer(),
          ],
        ),
      ),
    );
  }
}
