enum PrintType {
  oneLine,
  twoLines,
  threeLines,
}

class PrintProduct {
  final PrintType type;
  final List<String> lines;

  double get price {
    switch (type) {
      case PrintType.oneLine:
        return 5.0;
      case PrintType.twoLines:
        return 7.0;
      case PrintType.threeLines:
        return 9.0;
    }
  }

  PrintProduct({
    required this.type,
    required this.lines,
  });
}
