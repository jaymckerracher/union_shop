import 'package:flutter/material.dart';
import 'display_collection.dart';
import 'app_drawer.dart';

class CollectionGradPage extends StatelessWidget {
  const CollectionGradPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayCollection(products: [],),
      drawer: AppDrawer(),
    );
  }
}
