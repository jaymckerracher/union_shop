import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_print_label_to_line_num.dart';

void main() {
  test('mapPrintLabelToLineNum returns correct line numbers for text options',
      () {
    expect(mapPrintLabelToLineNum('One Line of Text'), 1);
    expect(mapPrintLabelToLineNum('Two Lines of Text'), 2);
    expect(mapPrintLabelToLineNum('Three Lines of Text'), 3);
    expect(mapPrintLabelToLineNum('Four Lines of Text'), 4);
  });

  test('mapPrintLabelToLineNum returns 1 for logo options', () {
    expect(mapPrintLabelToLineNum('Small Logo (Chest)'), 1);
    expect(mapPrintLabelToLineNum('Large Logo (Back)'), 1);
  });

  test('mapPrintLabelToLineNum returns 1 for unknown label', () {
    expect(mapPrintLabelToLineNum('Unknown Label'), 1);
  });
}
