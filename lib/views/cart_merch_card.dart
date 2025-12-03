import 'package:flutter/material.dart';
import '../models/cart_item_merch_model.dart';
import 'package:provider/provider.dart';
import '../view_models/cart_view_model.dart';

class CartMerchCard extends StatelessWidget {
  final CartItemMerch item;
  const CartMerchCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product info
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    style:
                        const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        final cartViewModel =
                            Provider.of<CartViewModel>(context, listen: false);
                        cartViewModel.removeMerchItem(item);
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(40, 24)),
                      child:
                          const Text('REMOVE', style: TextStyle(fontSize: 12)),
                    ),
                    const Text('  |  ',
                        style: TextStyle(fontSize: 12, color: Colors.black45)),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(40, 24)),
                      child: const Text('EDIT', style: TextStyle(fontSize: 12)),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  (item.product.price * item.quantity).toStringAsFixed(2),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
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
    );
  }
}
