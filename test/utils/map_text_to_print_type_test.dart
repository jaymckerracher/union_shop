import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_text_to_print_type.dart';
import 'package:union_shop/enums/print_type.dart';

void main() {
  test('mapTextToPrintType returns correct enum for known options', () {
    expect(mapTextToPrintType('One Line of Text'), PrintType.oneLine);
    expect(mapTextToPrintType('Two Lines of Text'), PrintType.twoLines);
    expect(mapTextToPrintType('Three Lines of Text'), PrintType.threeLines);
  });

  test('mapTextToPrintType returns oneLine for unknown option', () {
    expect(mapTextToPrintType('Unknown Option'), PrintType.oneLine);
  });
}
