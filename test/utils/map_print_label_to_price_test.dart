import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_print_label_to_price.dart';

void main() {
  test('mapPrintLabelToPrice returns correct price for text options', () {
    expect(mapPrintLabelToPrice('One Line of Text'), 3.0);
    expect(mapPrintLabelToPrice('Two Lines of Text'), 5.0);
    expect(mapPrintLabelToPrice('Three Lines of Text'), 7.5);
    expect(mapPrintLabelToPrice('Four Lines of Text'), 10.0);
  });

  test('mapPrintLabelToPrice returns correct price for logo options', () {
    expect(mapPrintLabelToPrice('Small Logo (Chest)'), 3.5);
    expect(mapPrintLabelToPrice('Large Logo (Back)'), 6.0);
  });

  test('mapPrintLabelToPrice returns null for unknown label', () {
    expect(mapPrintLabelToPrice('Unknown Label'), isNull);
  });
}
