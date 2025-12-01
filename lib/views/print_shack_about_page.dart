import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import 'app_drawer.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

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
                      'The Union Print Shack',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'images/print_shack/ps_2.webp',
                        fit: BoxFit.cover,
                        width: 340,
                        height: 120,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Want to add a personal touch? We’ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop – our team’s always happy to help you pick the right gear and answer any questions.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Uni Gear or Your Gear – We’ll Personalise It',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF444950),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Whether you’re repping your university or putting your own spin on a hoodie you already own, we’ve got you covered. We can personalise official uni-branded clothing and your own items – just bring them in and let’s get creative!",
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Simple Pricing, No Surprises',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF444950),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Customising your gear won’t break the bank – just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we’ll let you know as soon as it’s ready to collect.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Personalisation Terms & Conditions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF444950),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.",
                    style: TextStyle(fontSize: 16, color: Color(0xFF444950)),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Ready to Make It Yours?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF444950),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Pop in or get in touch today – let’s create something uniquely you with our personalisation service – The Union Print Shack!",
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
