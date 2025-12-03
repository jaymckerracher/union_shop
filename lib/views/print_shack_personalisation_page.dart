import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class PrintShackPersonalisationPage extends StatelessWidget {
  const PrintShackPersonalisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 48),
            Center(
              child: Text(
                'print shack',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 48),
            Footer(),
          ],
        ),
      ),
    );
  }
}
