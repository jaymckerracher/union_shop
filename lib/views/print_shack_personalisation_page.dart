import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import './app_drawer.dart';

class PrintShackPersonalisationPage extends StatefulWidget {
  const PrintShackPersonalisationPage({super.key});

  @override
  State<PrintShackPersonalisationPage> createState() =>
      _PrintShackPersonalisationPageState();
}

class _PrintShackPersonalisationPageState
    extends State<PrintShackPersonalisationPage> {
  final Map<String, double> priceMap = {
    'One Line of Text': 3.0,
    'Two Lines of Text': 5.0,
    'Three Lines of Text': 7.5,
    'Four Lines of Text': 10.0,
    'Small Logo (Chest)': 3.5,
    'Large Logo (Back)': 6.0,
  };

  final Map<String, int> textFieldCount = {
    'One Line of Text': 1,
    'Two Lines of Text': 2,
    'Three Lines of Text': 3,
    'Four Lines of Text': 4,
    'Small Logo (Chest)': 1,
    'Large Logo (Back)': 1,
  };

  String selectedOption = 'One Line of Text';

  final List<String> imagePaths = [
    'images/print_shack/ps_1.webp',
    'images/print_shack/ps_2.webp',
  ];

  int selectedImageIndex = 0;

  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    int numFields = textFieldCount[selectedOption] ?? 0;
    double price = priceMap[selectedOption] ?? 0.0;

    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePaths[selectedImageIndex],
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imagePaths.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding:
                        EdgeInsets.all(selectedImageIndex == index ? 3 : 0),
                    decoration: BoxDecoration(
                      border: selectedImageIndex == index
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePaths[index],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
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

            // Quantity and Add to Cart row
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Quantity counter
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) _quantity--;
                          });
                        },
                      ),
                      Text(
                        '$_quantity',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  // Add to Cart button
                  ElevatedButton(
                    onPressed: () {}, // No functionality yet
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
