/// Maps a print label (personalisation option) to the number of lines required.
int mapPrintLabelToLineNum(String label) {
  switch (label) {
    case 'One Line of Text':
      return 1;
    case 'Two Lines of Text':
      return 2;
    case 'Three Lines of Text':
      return 3;
    case 'Four Lines of Text':
      return 4;
    case 'Small Logo (Chest)':
      return 1;
    case 'Large Logo (Back)':
      return 1;
    default:
      return 1;
  }
}
