import 'package:flutter/material.dart';

class FilterModal extends StatefulWidget {
  final bool allProducts;
  const FilterModal({super.key, required this.allProducts});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  bool onSale = false;
  String selectedCategory = 'All';
  String selectedCollection = 'All';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filter Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('On Sale'),
              const Spacer(),
              Switch(
                  value: onSale, onChanged: (v) => setState(() => onSale = v)),
            ],
          ),
          const SizedBox(height: 12),
          if (widget.allProducts)
            Row(
              children: [
                const Text('Category'),
                const Spacer(),
                DropdownButton<String>(
                  value: selectedCategory,
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All')),
                    DropdownMenuItem(
                        value: 'Clothing', child: Text('Clothing')),
                    DropdownMenuItem(
                        value: 'Merchandise', child: Text('Merchandise')),
                  ],
                  onChanged: (v) => setState(() => selectedCategory = v!),
                ),
              ],
            ),
          if (widget.allProducts) const SizedBox(height: 12),
          if (widget.allProducts)
            Row(
              children: [
                const Text('Collection'),
                const Spacer(),
                DropdownButton<String>(
                  value: selectedCollection,
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All')),
                    DropdownMenuItem(
                        value: 'Collection 1', child: Text('Collection 1')),
                    DropdownMenuItem(
                        value: 'Collection 2', child: Text('Collection 2')),
                  ],
                  onChanged: (v) => setState(() => selectedCollection = v!),
                ),
              ],
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
