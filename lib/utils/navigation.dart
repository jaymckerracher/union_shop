import 'package:flutter/material.dart';

void navigateToHome(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
}

void navigateToAbout(BuildContext context) {
  Navigator.pushNamed(context, '/about');
}
