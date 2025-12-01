import 'package:flutter/material.dart';

void navigateToHome(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
}

void navigateToAbout(BuildContext context) {
  Navigator.pushNamed(context, '/about');
}

void navigateToPrintShackAbout(BuildContext context) {
  Navigator.pushNamed(context, '/personalisation');
}

void navigateToHalloween(BuildContext context) {
  Navigator.pushNamed(context, '/collections/halloween');
}

void navigateToEssential(BuildContext context) {
  Navigator.pushNamed(context, '/collections/essential');
}

void navigateToPortsmouth(BuildContext context) {
  Navigator.pushNamed(context, '/collections/portsmouth');
}
