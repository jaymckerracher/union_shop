import 'package:flutter/material.dart';
import 'display_collection.dart';
import 'app_drawer.dart';

class CollectionGraduationPage extends StatelessWidget {
  const CollectionGraduationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayCollection(filter: 'graduation'),
      drawer: AppDrawer(),
    );
  }
}
