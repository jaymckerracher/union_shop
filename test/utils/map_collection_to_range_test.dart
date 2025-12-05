import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_collection_to_range.dart';
import 'package:union_shop/enums/collection.dart';

void main() {
  test('mapCollectionToRange returns "all" for null', () {
    expect(mapCollectionToRange(null), 'all');
  });

  test('mapCollectionToRange returns "halloween" for Collections.halloween',
      () {
    expect(mapCollectionToRange(Collections.halloween), 'halloween');
  });

  test(
      'mapCollectionToRange returns "essential" for Collections.signatureAndEssentialRange',
      () {
    expect(mapCollectionToRange(Collections.signatureAndEssentialRange),
        'essential');
  });

  test(
      'mapCollectionToRange returns "portsmouth" for Collections.portsmouthCityCollection',
      () {
    expect(mapCollectionToRange(Collections.portsmouthCityCollection),
        'portsmouth');
  });

  test('mapCollectionToRange returns "pride" for Collections.prideCollection',
      () {
    expect(mapCollectionToRange(Collections.prideCollection), 'pride');
  });

  test('mapCollectionToRange returns "graduation" for Collections.graduation',
      () {
    expect(mapCollectionToRange(Collections.graduation), 'graduation');
  });
}
