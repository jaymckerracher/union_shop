import 'package:flutter/material.dart';

class FilterSortMenuBar extends StatelessWidget {
  const FilterSortMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
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
                  child: TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Filter Options',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Text('On Sale'),
                                    const Spacer(),
                                    Switch(value: false, onChanged: (v) {}),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const Text('Category'),
                                    const Spacer(),
                                    DropdownButton<String>(
                                      value: 'All',
                                      items: const [
                                        DropdownMenuItem(
                                            value: 'All', child: Text('All')),
                                        DropdownMenuItem(
                                            value: 'Clothing',
                                            child: Text('Clothing')),
                                        DropdownMenuItem(
                                            value: 'Merchandise',
                                            child: Text('Merchandise')),
                                      ],
                                      onChanged: (v) {},
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const Text('Collection'),
                                    const Spacer(),
                                    DropdownButton<String>(
                                      value: 'All',
                                      items: const [
                                        DropdownMenuItem(
                                            value: 'All', child: Text('All')),
                                        DropdownMenuItem(
                                            value: 'Collection 1',
                                            child: Text('Collection 1')),
                                        DropdownMenuItem(
                                            value: 'Collection 2',
                                            child: Text('Collection 2')),
                                      ],
                                      onChanged: (v) {},
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.tune, color: Colors.black54),
                    label: const Text('Filter',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
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
                  child: TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Sort Options',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
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
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.sort, color: Colors.black54),
                    label: const Text('Sort',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
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
