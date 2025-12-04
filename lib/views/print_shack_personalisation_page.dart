import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import './app_drawer.dart';
import 'package:provider/provider.dart';
import '../models/print_model.dart';
import '../utils/map_text_to_print_type.dart';
import '../utils/map_print_label_to_price.dart';
import '../utils/map_print_label_to_line_num.dart';
import '../models/cart_item_print_model.dart';
import '../view_models/cart_view_model.dart';
import 'package:uuid/uuid.dart';

class PrintShackPersonalisationPage extends StatefulWidget {
  const PrintShackPersonalisationPage({super.key});

  @override
  State<PrintShackPersonalisationPage> createState() =>
      _PrintShackPersonalisationPageState();
}

class _PrintShackPersonalisationPageState
    extends State<PrintShackPersonalisationPage> {
  String selectedOption = 'One Line of Text';

  // Controllers for each personalisation line
  List<TextEditingController> _controllers = [];

  final List<String> imagePaths = [
    'images/print_shack/ps_1.webp',
    'images/print_shack/ps_2.webp',
  ];

  int selectedImageIndex = 0;

  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    int numFields = mapPrintLabelToLineNum(selectedOption);
    _controllers = List.generate(numFields, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int numFields = mapPrintLabelToLineNum(selectedOption);
    double price = mapPrintLabelToPrice(selectedOption) ?? 0.0;

    // If the number of fields changed, update controllers
    if (_controllers.length != numFields) {
      // Dispose old controllers
      for (final controller in _controllers) {
        controller.dispose();
      }
      _controllers =
          List.generate(numFields, (index) => TextEditingController());
    }

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
                items: [
                  'One Line of Text',
                  'Two Lines of Text',
                  'Three Lines of Text',
                  'Four Lines of Text',
                  'Small Logo (Chest)',
                  'Large Logo (Back)'
                ].map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedOption = value;
                      // Re-initialize controllers for new option
                      for (final controller in _controllers) {
                        controller.dispose();
                      }
                      int numFields = mapPrintLabelToLineNum(selectedOption);
                      _controllers = List.generate(
                          numFields, (index) => TextEditingController());
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
                  controller: _controllers[i],
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
                      const Text(
                        'Quantity:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 12),
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
                    onPressed: () {
                      final lines = _controllers.map((c) => c.text).toList();
                      final hasEmptyField =
                          lines.any((line) => line.trim().isEmpty);
                      if (hasEmptyField) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please fill in all fields before adding to cart.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      final cart =
                          Provider.of<CartViewModel>(context, listen: false);
                      final type = mapTextToPrintType(selectedOption);
                      final print = Print(type: type, lines: lines);
                      const uuid = Uuid();
                      cart.addPrintItem(CartItemPrint(
                        id: uuid.v4(),
                        print: print,
                        quantity: _quantity,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart!')),
                      );
                    },
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
