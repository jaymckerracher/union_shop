import 'package:flutter/material.dart';

class FilterSortMenuBar extends StatelessWidget {
  const FilterSortMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Filter By
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FILTER BY',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'All products',
                      items: const [
                        DropdownMenuItem(
                          value: 'All products',
                          child: Text('All products'),
                        ),
                        DropdownMenuItem(
                          value: 'Clothing',
                          child: Text('Clothing'),
                        ),
                        DropdownMenuItem(
                          value: 'Merchandise',
                          child: Text('Merchandise'),
                        ),
                        DropdownMenuItem(
                          value: 'Sale',
                          child: Text('Sale'),
                        ),
                      ],
                      onChanged: (_) {}, // No functionality yet
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          size: 24, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
            // Sort By
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SORT BY',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'Featured',
                      items: const [
                        DropdownMenuItem(
                          value: 'Featured',
                          child: Text('Featured'),
                        ),
                        DropdownMenuItem(
                          value: 'Alphabetical',
                          child: Text('Alphabetical'),
                        ),
                        DropdownMenuItem(
                          value: 'Price: Low to High',
                          child: Text('Price: Low to High'),
                        ),
                        DropdownMenuItem(
                          value: 'Price: High to Low',
                          child: Text('Price: High to Low'),
                        ),
                      ],
                      onChanged: (_) {}, // No functionality yet
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          size: 24, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
