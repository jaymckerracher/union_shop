import 'package:flutter/material.dart';
import 'display_collection.dart';
import 'app_drawer.dart';

class CategoryMerchPage extends StatelessWidget {
  const CategoryMerchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayCollection(filter: 'merchandise'),
      drawer: AppDrawer(),
    );
  }
}
