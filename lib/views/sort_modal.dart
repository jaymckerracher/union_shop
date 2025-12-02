import 'package:flutter/material.dart';

class SortModal extends StatelessWidget {
  const SortModal({super.key});

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
            title: const Text('Featured'),
            leading: const Icon(Icons.star),
            onTap: () {
              Navigator.of(context).pop();
              // Handle sort selection
            },
          ),
          ListTile(
            title: const Text('Alphabetical'),
            leading: const Icon(Icons.sort_by_alpha),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Price: Low to High'),
            leading: const Icon(Icons.arrow_downward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Price: High to Low'),
            leading: const Icon(Icons.arrow_upward),
            onTap: () {
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
