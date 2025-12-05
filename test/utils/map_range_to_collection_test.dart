import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_range_to_collection.dart';
import 'package:union_shop/enums/collection.dart';

void main() {
  test('mapRangeToCollection returns correct enum for known ranges', () {
    expect(mapRangeToCollection('halloween'), Collections.halloween);
    expect(mapRangeToCollection('essential'),
        Collections.signatureAndEssentialRange);
    expect(mapRangeToCollection('portsmouth'),
        Collections.portsmouthCityCollection);
    expect(mapRangeToCollection('pride'), Collections.prideCollection);
    expect(mapRangeToCollection('graduation'), Collections.graduation);
  });

  test('mapRangeToCollection is case insensitive', () {
    expect(mapRangeToCollection('HaLlOwEeN'), Collections.halloween);
    expect(mapRangeToCollection('ESSENTIAL'),
        Collections.signatureAndEssentialRange);
  });

  test('mapRangeToCollection returns null for unknown range', () {
    expect(mapRangeToCollection('unknown'), isNull);
  });
}
