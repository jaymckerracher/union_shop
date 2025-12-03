import 'package:flutter/material.dart';
import '../models/cart_item_print_model.dart';

class CartPrintCard extends StatelessWidget {
  final CartItemPrint item;
  const CartPrintCard({super.key, required this.item});

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
          // Print info
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black87),
                    )),
                Text('QTY: ${item.quantity}',
                    style:
                        const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
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
                  item.print.price.toStringAsFixed(2),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                // Placeholder for print image (if any)
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey.shade200,
                  child:
                      const Icon(Icons.print, size: 32, color: Colors.black38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
