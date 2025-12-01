import 'package:flutter/material.dart';
import '../view_models/products_view_model.dart';
import '../enums/collection.dart';

class HomeRangePreview extends StatelessWidget {
  final String range;
  const HomeRangePreview({super.key, required this.range});

  Collections? _mapRangeToCollection(String range) {
    switch (range.toLowerCase()) {
      case 'halloween':
        return Collections.halloween;
      case 'essential':
        return Collections.signatureAndEssentialRange;
      case 'porstmouth':
        return Collections.portsmouthCityCollection;
      case 'pride':
        return Collections.prideCollection;
      case 'graduation':
        return Collections.graduation;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final collection = _mapRangeToCollection(range);
    final viewModel = ProductsViewModel(); // new instance for each preview
    viewModel.updateFilter(collection: collection);

    // Placeholder UI for now
    return Column();
  }
}
