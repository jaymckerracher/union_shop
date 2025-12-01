import 'package:flutter/material.dart';
import 'display_collection.dart';
import 'app_drawer.dart';

class CollectionHalloweenPage extends StatelessWidget {
  const CollectionHalloweenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayCollection(filter: 'halloween'),
      drawer: AppDrawer(),
    );
  }
}
