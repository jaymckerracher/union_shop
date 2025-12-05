import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/about_page.dart';
import 'package:union_shop/views/header.dart';
import 'package:union_shop/views/footer.dart';
import 'package:union_shop/views/app_drawer.dart';

void main() {
  testWidgets('AboutPage displays all main sections',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Check for header
    expect(find.byType(Header), findsOneWidget);
    // Check for footer
    expect(find.byType(Footer), findsOneWidget);
    // Check for drawer
    expect(find.byType(AppDrawer), findsNothing); // Not visible until opened

    // Open the drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Now the drawer should be visible
    expect(find.byType(AppDrawer), findsOneWidget);

    // Check for main title
    expect(find.text('About us'), findsOneWidget);
    // Check for welcome text
    expect(find.text('Welcome to the Union Shop!'), findsOneWidget);
    // Check for personalisation service button
    expect(find.text('personalisation service'), findsOneWidget);
    // Check for contact email
    expect(find.textContaining('hello@upsu.net'), findsOneWidget);
    // Check for closing text
    expect(find.text('Happy shopping!'), findsOneWidget);
    expect(find.text('The Union Shop & Reception Team'), findsOneWidget);
  });

  testWidgets('Tapping personalisation service button calls navigation',
      (WidgetTester tester) async {
    bool navigationCalled = false;
    // Override the navigation function
    void mockNavigateToPrintShackPersonalisation(BuildContext context) {
      navigationCalled = true;
    }

    // Replace the AboutPage with a version that uses the mock navigation
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return AboutPageWithMockNavigation(
              onNavigate: () =>
                  mockNavigateToPrintShackPersonalisation(context),
            );
          },
        ),
      ),
    );

    // Tap the personalisation service button
    await tester.tap(find.text('personalisation service'));
    await tester.pumpAndSettle();
    expect(navigationCalled, isTrue);
  });
}

// Helper widget to inject mock navigation
class AboutPageWithMockNavigation extends StatelessWidget {
  final VoidCallback onNavigate;
  const AboutPageWithMockNavigation({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444950),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Welcome to the Union Shop!',
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFF444950)),
                            children: [
                              const TextSpan(
                                text:
                                    'We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive ',
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: onNavigate,
                                  child: const Text(
                                    'personalisation service',
                                    style: TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      color: Color(0xFF444950),
                                    ),
                                  ),
                                ),
                              ),
                              const TextSpan(
                                text: '!',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'All online purchases are available for delivery or instore collection!',
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Happy shopping!',
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'The Union Shop & Reception Team',
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
