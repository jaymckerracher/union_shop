import '../enums/collection.dart';

String mapCollectionToRange(Collections? collection) {
  if (collection == null) return 'all';

  switch (collection) {
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
  }
}
