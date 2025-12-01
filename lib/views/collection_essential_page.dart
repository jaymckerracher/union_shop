import 'package:flutter/material.dart';
import 'display_collection.dart';
import 'app_drawer.dart';

class CollectionEssentialPage extends StatelessWidget {
  const CollectionEssentialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayCollection(filter: 'essential'),
      drawer: AppDrawer(),
    );
  }
}
