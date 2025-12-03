import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header.dart';
import 'footer.dart';
import '../view_models/cart_view_model.dart';
import 'cart_clothing_card.dart';

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
                        // Table header
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text('PRODUCT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2)),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('QTY',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2)),
                              ),
                            ],
                          ),
                        ),
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
                        // Table header
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text('PRODUCT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2)),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('QTY',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2)),
                              ),
                            ],
                          ),
                        ),
                        ...merchItems.map((item) => Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: Colors.grey.shade200, width: 1),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18.0, horizontal: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product info
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.product.title.toUpperCase(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              letterSpacing: 1.1),
                                        ),
                                        const SizedBox(height: 4),
                                        Text('QTY: ${item.quantity}',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54)),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  minimumSize:
                                                      const Size(40, 24)),
                                              child: const Text('REMOVE',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                            const Text('  |  ',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black45)),
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  minimumSize:
                                                      const Size(40, 24)),
                                              child: const Text('EDIT',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Price and image (right-aligned)
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          item.product.price.toStringAsFixed(2),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset(
                                            item.product.imageUrls[0],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                        // Table header
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text('PRODUCT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2)),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text('QTY',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2)),
                              ),
                            ],
                          ),
                        ),
                        ...printItems.map((item) => Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: Colors.grey.shade200, width: 1),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18.0, horizontal: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Print info
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.print.type.name.toUpperCase(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              letterSpacing: 1.1),
                                        ),
                                        const SizedBox(height: 4),
                                        ...item.print.lines.map((line) => Text(
                                              line,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black87),
                                            )),
                                        Text('QTY: ${item.quantity}',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54)),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  minimumSize:
                                                      const Size(40, 24)),
                                              child: const Text('REMOVE',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                            const Text('  |  ',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black45)),
                                            TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  minimumSize:
                                                      const Size(40, 24)),
                                              child: const Text('EDIT',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Price and image (right-aligned)
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          item.print.price.toStringAsFixed(2),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(height: 8),
                                        // Placeholder for print image (if any)
                                        Container(
                                          width: 60,
                                          height: 60,
                                          color: Colors.grey.shade200,
                                          child: const Icon(Icons.print,
                                              size: 32, color: Colors.black38),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
