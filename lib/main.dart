import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/about_page.dart';
import 'package:union_shop/views/collection_halloween_page.dart';
import 'package:union_shop/views/collection_essential_page.dart';
import 'package:union_shop/views/collection_portsmouth_page.dart';
import 'package:union_shop/views/home_page.dart';
import 'package:union_shop/views/print_shack_about_page.dart';
import 'package:union_shop/view_models/cart_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartViewModel(),
      child: const UnionShopApp(),
    ),
  );
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/personalisation': (context) => const PrintShackAboutPage(),
        '/collections/halloween': (context) => const CollectionHalloweenPage(),
        '/collections/essential': (context) => const CollectionEssentialPage(),
        '/collections/portsmouth': (context) =>
            const CollectionPortsmouthPage(),
      },
    );
  }
}
