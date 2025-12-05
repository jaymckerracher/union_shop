import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/enums/collection.dart';

void main() {
  group('Collections enum', () {
    test('should contain all expected values', () {
      expect(Collections.values.length, 5);
      expect(
          Collections.values,
          containsAll([
            Collections.halloween,
            Collections.signatureAndEssentialRange,
            Collections.portsmouthCityCollection,
            Collections.prideCollection,
            Collections.graduation,
          ]));
    });

    test('enum names should match expected strings', () {
      expect(Collections.halloween.name, 'halloween');
      expect(Collections.signatureAndEssentialRange.name,
          'signatureAndEssentialRange');
      expect(Collections.portsmouthCityCollection.name,
          'portsmouthCityCollection');
      expect(Collections.prideCollection.name, 'prideCollection');
      expect(Collections.graduation.name, 'graduation');
    });
  });
}
