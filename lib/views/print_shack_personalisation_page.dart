import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class PrintShackPersonalisationPage extends StatefulWidget {
  const PrintShackPersonalisationPage({super.key});

  @override
  State<PrintShackPersonalisationPage> createState() =>
      _PrintShackPersonalisationPageState();
}

class _PrintShackPersonalisationPageState
    extends State<PrintShackPersonalisationPage> {
  final Map<String, double> priceMap = {
    'One Line of Text': 5.0,
    'Two Lines of Text': 7.0,
    'Three Lines of Text': 9.0,
    'Four Lines of Text': 11.0,
    'Small Logo (Chest)': 8.0,
    'Large Logo (Back)': 12.0,
  };

  final Map<String, int> textFieldCount = {
    'One Line of Text': 1,
    'Two Lines of Text': 2,
    'Three Lines of Text': 3,
    'Four Lines of Text': 4,
    'Small Logo (Chest)': 0,
    'Large Logo (Back)': 0,
  };

  String selectedOption = 'One Line of Text';

  @override
  Widget build(BuildContext context) {
    int numFields = textFieldCount[selectedOption] ?? 0;
    double price = priceMap[selectedOption] ?? 0.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 32),
            const Text(
              'Personalisation',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: DropdownButtonFormField<String>(
                initialValue: selectedOption,
                decoration: const InputDecoration(
                  labelText: 'Choose one',
                  border: OutlineInputBorder(),
                ),
                items: priceMap.keys.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedOption = value;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Price: £${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            ...List.generate(numFields, (i) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Personalisation Line ${i + 1}',
                    border: const OutlineInputBorder(),
                  ),
                ),
              );
            }),
            const SizedBox(height: 48),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
