import 'package:flutter/material.dart';

void navigateToHome(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
}

void navigateToAbout(BuildContext context) {
  Navigator.pushNamed(context, '/about');
}

void navigateToPrintShackAbout(BuildContext context) {
  Navigator.pushNamed(context, '/personalisation/about');
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

void navigateToPride(BuildContext context) {
  Navigator.pushNamed(context, '/collections/pride');
}

void navigateToGrad(BuildContext context) {
  Navigator.pushNamed(context, '/collections/graduation');
}

void navigateToClothing(BuildContext context) {
  Navigator.pushNamed(context, '/collections/clothing');
}

void navigateToMerch(BuildContext context) {
  Navigator.pushNamed(context, '/collections/merchandise');
}

void navigateToSale(BuildContext context) {
  Navigator.pushNamed(context, '/collections/sale');
}

void navigateToProducts(BuildContext context) {
  Navigator.pushNamed(context, '/products');
}

void navigateToProduct(BuildContext context, String id) {
  Navigator.pushNamed(context, '/products/$id');
}

void navigateToSearch(BuildContext context) {
  Navigator.pushNamed(context, '/search');
}

void navigateToPrintShackPersonalisation(BuildContext context) {
  Navigator.pushNamed(context, '/personalisation');
}
