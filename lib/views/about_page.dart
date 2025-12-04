import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import 'app_drawer.dart';
import '../utils/navigation.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                                child: GestureDetector(
                                  onTap: () {
                                    navigateToPrintShackPersonalisation(
                                        context);
                                  },
                                  child: const Text(
                                    'personalisation service',
                                    style: TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
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
