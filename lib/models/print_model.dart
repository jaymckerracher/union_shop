import '../enums/print_type.dart';

class Print {
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

  Print({
    required this.type,
    required this.lines,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'lines': lines,
    };
  }

  factory Print.fromMap(Map<String, dynamic> map) {
    return Print(
      type: PrintType.values.firstWhere((e) => e.name == map['type']),
      lines: List<String>.from(map['lines']),
    );
  }
}
