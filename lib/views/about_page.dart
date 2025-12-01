import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: Center(
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF444950),
                ),
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
