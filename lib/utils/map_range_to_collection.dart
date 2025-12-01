import '../enums/collection.dart';

Collections? mapRangeToCollection(String range) {
  switch (range.toLowerCase()) {
    case 'halloween':
      return Collections.halloween;
    case 'essential':
      return Collections.signatureAndEssentialRange;
    case 'porstmouth':
      return Collections.portsmouthCityCollection;
    case 'pride':
      return Collections.prideCollection;
    case 'graduation':
      return Collections.graduation;
    default:
      return null;
  }
}
