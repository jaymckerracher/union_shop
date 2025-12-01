import 'package:flutter/material.dart';
import '../utils/navigation.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF4d2963)),
            child: Text(
              'The UNION',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ExpansionTile(
            title: const Text('Shop'),
            children: [
              ListTile(
                title: const Text('Clothing'),
                onTap: () {
                  // Navigate to clothing
                },
              ),
              ListTile(
                title: const Text('Merchandise'),
                onTap: () {
                  // Navigate to merchandise
                },
              ),
              ListTile(
                title: const Text('Halloween 🎃'),
                onTap: () {
                  navigateToHalloween(context);
                },
              ),
              ListTile(
                title: const Text('Signature & Essential Range'),
                onTap: () {
                  // Navigate to S&E
                },
              ),
              ListTile(
                title: const Text('Portsmouth City Collection'),
                onTap: () {
                  // Navigate to PCC
                },
              ),
              ListTile(
                title: const Text('Pride Collection'),
                onTap: () {
                  // Navigate to Pride
                },
              ),
              ListTile(
                title: const Text('Graduation'),
                onTap: () {
                  // Navigate to Graduation
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('The Print Shack'),
            children: [
              ListTile(
                title: const Text('About'),
                onTap: () {
                  navigateToPrintShackAbout(context);
                },
              ),
              ListTile(
                title: const Text('Personalisation'),
                onTap: () {
                  // Navigate to print shack personalisation
                },
              ),
            ],
          ),
          ListTile(
            title: const Text('SALE!'),
            onTap: () {
              // Navigate to sale
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              navigateToAbout(context);
            },
          ),
        ],
      ),
    );
  }
}
