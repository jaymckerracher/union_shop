import 'package:flutter/material.dart';
import '../view_models/products_view_model.dart';
import '../enums/product_category.dart';
import '../enums/collection.dart';
import '../utils/map_range_to_collection.dart';
import '../utils/map_collection_to_range.dart';
import '../utils/map_category.dart';
import '../utils/map_category_reverse.dart';

class FilterModal extends StatefulWidget {
  final bool allCollections;
  final bool allCategories;
  final ProductsViewModel viewModel;
  const FilterModal({
    super.key,
    required this.allCollections,
    required this.allCategories,
    required this.viewModel,
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late bool onSale;
  late ProductCategory? selectedCategory;
  late Collections? selectedCollection;

  @override
  void initState() {
    super.initState();
    onSale = widget.viewModel.currentFilter.onSale ?? false;
    selectedCategory = widget.viewModel.currentFilter.category;
    selectedCollection = widget.viewModel.currentFilter.collection;
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
          if (widget.allCategories)
            Row(
              children: [
                const Text('Category'),
                const Spacer(),
                DropdownButton<String>(
                  value: mapCategoryReverse(selectedCategory),
                  items: const [
                    DropdownMenuItem(value: 'all', child: Text('All')),
                    DropdownMenuItem(
                        value: 'clothing', child: Text('Clothing')),
                    DropdownMenuItem(
                        value: 'merchandise', child: Text('Merchandise')),
                  ],
                  onChanged: (v) => {
                    setState(() =>
                        selectedCategory = v == 'all' ? null : mapCategory(v!)!)
                  },
                ),
              ],
            ),
          if (widget.allCollections)
            Row(
              children: [
                const Text('Collection'),
                const Spacer(),
                DropdownButton<String>(
                  value: mapCollectionToRange(selectedCollection),
                  items: const [
                    DropdownMenuItem(value: 'all', child: Text('All')),
                    DropdownMenuItem(
                        value: 'halloween', child: Text('Halloween')),
                    DropdownMenuItem(
                        value: 'essential',
                        child: Text('Signature & Essential')),
                    DropdownMenuItem(
                        value: 'portsmouth', child: Text('Portsmouth City')),
                    DropdownMenuItem(value: 'pride', child: Text('Pride')),
                    DropdownMenuItem(
                        value: 'graduation', child: Text('Graduation')),
                  ],
                  onChanged: (v) => {
                    setState(() => selectedCollection =
                        v == 'all' ? null : mapRangeToCollection(v!)!)
                  },
                ),
              ],
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  widget.viewModel.updateFilter(
                      category: selectedCategory,
                      collection: selectedCollection,
                      onSale: onSale);
                },
                child: const Text('Update Selection'),
              ),
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
