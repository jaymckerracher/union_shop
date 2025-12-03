import '../models/print_model.dart';

/// Maps a personalisation option string to the corresponding PrintType enum value.
PrintType mapTextToPrintType(String option) {
  switch (option) {
    case 'One Line of Text':
      return PrintType.oneLine;
    case 'Two Lines of Text':
      return PrintType.twoLines;
    case 'Three Lines of Text':
      return PrintType.threeLines;
    default:
      return PrintType.oneLine;
  }
}
