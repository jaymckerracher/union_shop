import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/map_collection_to_label.dart';
import 'package:union_shop/enums/collection.dart';

void main() {
  test('mapCollectionToLabel returns "all" for null', () {
    expect(mapCollectionToLabel(null), 'all');
  });

  test('mapCollectionToLabel returns "Halloween" for Collections.halloween',
      () {
    expect(mapCollectionToLabel(Collections.halloween), 'Halloween');
  });

  test(
      'mapCollectionToLabel returns "Signature & Essential" for Collections.signatureAndEssentialRange',
      () {
    expect(mapCollectionToLabel(Collections.signatureAndEssentialRange),
        'Signature & Essential');
  });

  test(
      'mapCollectionToLabel returns "Portsmouth City" for Collections.portsmouthCityCollection',
      () {
    expect(mapCollectionToLabel(Collections.portsmouthCityCollection),
        'Portsmouth City');
  });

  test('mapCollectionToLabel returns "Pride" for Collections.prideCollection',
      () {
    expect(mapCollectionToLabel(Collections.prideCollection), 'Pride');
  });

  test('mapCollectionToLabel returns "Graduation" for Collections.graduation',
      () {
    expect(mapCollectionToLabel(Collections.graduation), 'Graduation');
  });
}
