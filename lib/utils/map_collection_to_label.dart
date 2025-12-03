import '../enums/collection.dart';

String mapCollectionToRange(Collections? collection) {
  if (collection == null) return 'all';

  switch (collection) {
    case Collections.halloween:
      return 'Halloween';
    case Collections.signatureAndEssentialRange:
      return 'Signature & Essential';
    case Collections.portsmouthCityCollection:
      return 'Portsmouth City';
    case Collections.prideCollection:
      return 'Pride';
    case Collections.graduation:
      return 'Graduation';
  }
}
