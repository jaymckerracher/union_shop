import '../enums/collection.dart';

String mapCollectionToRange(Collections range) {
  switch (range) {
    case Collections.halloween:
      return 'halloween';
    case Collections.signatureAndEssentialRange:
      return 'essential';
    case Collections.portsmouthCityCollection:
      return 'portsmouth';
    case Collections.prideCollection:
      return 'pride';
    case Collections.graduation:
      return 'graduation';
    default:
      return '';
  }
}
