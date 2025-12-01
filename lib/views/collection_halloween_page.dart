import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class CollectionHalloweenPage extends StatelessWidget {
  const CollectionHalloweenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Header(),
          SizedBox(height: 32),
          Center(
            child: Text(
              'Halloween',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF444950),
              ),
            ),
          ),
          Spacer(),
          Footer(),
        ],
      ),
    );
  }
}
