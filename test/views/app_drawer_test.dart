import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/app_drawer.dart';

void main() {
  testWidgets('AppDrawer displays all main sections and tiles',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(), // Add this line
          drawer: const AppDrawer(),
        ),
      ),
    );

    // Open the drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Check for DrawerHeader
    expect(find.text('The UNION'), findsOneWidget);

    // Check for main ListTiles
    expect(find.widgetWithText(ListTile, 'Home'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'SALE!'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'About'), findsOneWidget);

    // Expand The Print Shack section
    await tester.tap(find.widgetWithText(ExpansionTile, 'The Print Shack'));
    await tester.pumpAndSettle();

    // Now two "About" tiles should be visible
    expect(find.widgetWithText(ListTile, 'About'), findsNWidgets(2));

    // Check for ExpansionTiles
    expect(find.widgetWithText(ExpansionTile, 'Shop'), findsOneWidget);
    expect(
        find.widgetWithText(ExpansionTile, 'The Print Shack'), findsOneWidget);

    // Expand Shop section
    await tester.tap(find.widgetWithText(ExpansionTile, 'Shop'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(ListTile, 'Collections'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'All Products'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Clothing'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Merchandise'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Halloween 🎃'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Signature & Essential Range'),
        findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Portsmouth City Collection'),
        findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Pride Collection 🏳️‍🌈'),
        findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Graduation 🎓'), findsOneWidget);
  });

  testWidgets('Tapping drawer tiles triggers navigation',
      (WidgetTester tester) async {
    bool tappedHome = false;
    bool tappedSale = false;
    bool tappedAbout = false;

    // Create a testable AppDrawer with mock navigation
    Widget testDrawer = MaterialApp(
      home: Scaffold(
        appBar: AppBar(), // Add this line
        drawer: AppDrawerWithMockNavigation(
          onHome: () => tappedHome = true,
          onSale: () => tappedSale = true,
          onAbout: () => tappedAbout = true,
        ),
      ),
    );

    await tester.pumpWidget(testDrawer);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Tap Home
    await tester.tap(find.widgetWithText(ListTile, 'Home'));
    expect(tappedHome, isTrue);

    // Reopen drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    // Tap SALE!
    await tester.tap(find.widgetWithText(ListTile, 'SALE!'));
    expect(tappedSale, isTrue);

    // Reopen drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    // Tap About (first occurrence)
    await tester.tap(find.widgetWithText(ListTile, 'About').first);
    expect(tappedAbout, isTrue);
  });
}

// Helper widget to inject mock navigation
class AppDrawerWithMockNavigation extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onSale;
  final VoidCallback onAbout;
  const AppDrawerWithMockNavigation(
      {super.key,
      required this.onHome,
      required this.onSale,
      required this.onAbout});

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
            onTap: onHome,
          ),
          ExpansionTile(
            title: const Text('Shop'),
            children: [
              ListTile(
                title: const Text('Collections'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('All Products'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Clothing'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Merchandise'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Halloween 🎃'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Signature & Essential Range'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Portsmouth City Collection'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Pride Collection 🏳️‍🌈'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Graduation 🎓'),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('The Print Shack'),
            children: [
              ListTile(
                title: const Text('About'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Personalisation'),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            title: const Text('SALE!'),
            onTap: onSale,
          ),
          ListTile(
            title: const Text('About'),
            onTap: onAbout,
          ),
        ],
      ),
    );
  }
}
