import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opening Hours',
            style: TextStyle(
              color: Color(0xFF444950),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Row(
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
          SizedBox(height: 12),
          Text(
            'Closing 4pm 19/12/2025',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Reopening 10am 05/01/2026',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Last post date: 12pm on 18/12/2025',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          SizedBox(height: 12),
          Text(
            '--------------------------',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '(Term Time)',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Monday - Friday 10am - 4pm',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          SizedBox(height: 12),
          Text(
            '(Outside of Term Time / Consolidation Weeks)',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Monday - Friday 10am - 3pm',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Purchase online 24/7',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF444950),
            ),
          ),
        ],
      ),
    );
  }
}
