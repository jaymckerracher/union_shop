import 'package:flutter/material.dart';
import '../utils/navigation.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(82, 145, 135, 150),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Opening Hours',
            style: TextStyle(
              color: Color(0xFF444950),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Text('❄️ ', style: TextStyle(fontSize: 18)),
              Text(
                'Winter Break Closure Dates ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFF444950),
                ),
              ),
              Text('❄️', style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Closing 4pm 19/12/2025',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Reopening 10am 05/01/2026',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Last post date: 12pm on 18/12/2025',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '--------------------------',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '(Term Time)',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Monday - Friday 10am - 4pm',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '(Outside of Term Time / Consolidation Weeks)',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Monday - Friday 10am - 3pm',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Purchase online 24/7',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Help and Information',
            style: TextStyle(
              color: Color(0xFF444950),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => navigateToSearch(context),
            child: const Text(
              'Search',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                color: Color(0xFF444950),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Terms & Conditions of Sale Policy',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
