import 'package:flutter/material.dart';
import 'display_collection.dart';
import 'app_drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayCollection(filter: 'all'),
      drawer: AppDrawer(),
    );
  }
}
