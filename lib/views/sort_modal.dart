import 'package:flutter/material.dart';
import '../view_models/products_view_model.dart';

class SortModal extends StatelessWidget {
  final ProductsViewModel viewModel;
  const SortModal({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Sort Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Alphabetical'),
            leading: const Icon(Icons.sort_by_alpha),
            selected: viewModel.sort.sortBy == 'alphabetical',
            onTap: () {
              viewModel.updateSort(sortBy: 'alphabetical', isAscending: true);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Price: Low to High'),
            leading: const Icon(Icons.arrow_upward),
            selected:
                viewModel.sort.sortBy == 'price' && viewModel.sort.isAscending,
            onTap: () {
              viewModel.updateSort(sortBy: 'price', isAscending: true);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Price: High to Low'),
            leading: const Icon(Icons.arrow_downward),
            selected:
                viewModel.sort.sortBy == 'price' && !viewModel.sort.isAscending,
            onTap: () {
              viewModel.updateSort(sortBy: 'price', isAscending: false);
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 12),
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
