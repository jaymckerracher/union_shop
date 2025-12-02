import 'package:flutter/material.dart';
import '../view_models/products_view_model.dart';

class FilterModal extends StatefulWidget {
  final bool allProducts;
  final bool allCategories;
  final ProductsViewModel viewModel;
  const FilterModal({
    super.key,
    required this.allProducts,
    required this.allCategories,
    required this.viewModel,
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late bool onSale;
  late String selectedCategory;
  late String selectedCollection;

  @override
  void initState() {
    super.initState();
    onSale = widget.viewModel.currentFilter.onSale ?? false;
    selectedCategory = widget.viewModel.currentFilter.category?.name ?? 'All';
    selectedCollection =
        widget.viewModel.currentFilter.collection?.name ?? 'All';
  }

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
          Row(
            children: [
              const Text('Category'),
              const Spacer(),
              DropdownButton<String>(
                value: selectedCategory,
                items: const [
                  DropdownMenuItem(value: 'All', child: Text('All')),
                  DropdownMenuItem(value: 'clothing', child: Text('Clothing')),
                  DropdownMenuItem(
                      value: 'merchandise', child: Text('Merchandise')),
                ],
                onChanged: (v) => setState(() => selectedCategory = v!),
              ),
            ],
          ),
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
