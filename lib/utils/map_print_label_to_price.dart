/// Maps a print label (personalisation option) to its price.
double? mapPrintLabelToPrice(String label) {
  switch (label) {
    case 'One Line of Text':
      return 3.0;
    case 'Two Lines of Text':
      return 5.0;
    case 'Three Lines of Text':
      return 7.5;
    case 'Four Lines of Text':
      return 10.0;
    case 'Small Logo (Chest)':
      return 3.5;
    case 'Large Logo (Back)':
      return 6.0;
    default:
      return null;
  }
}
