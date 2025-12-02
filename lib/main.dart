import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/about_page.dart';
import 'package:union_shop/views/collection_halloween_page.dart';
import 'package:union_shop/views/collection_essential_page.dart';
import 'package:union_shop/views/collection_portsmouth_page.dart';
import 'package:union_shop/views/collection_grad_page.dart';
import 'package:union_shop/views/collection_pride_page.dart';
import 'package:union_shop/views/category_clothing_page.dart';
import 'package:union_shop/views/category_merch_page.dart';
import 'package:union_shop/views/sale_page.dart';
import 'package:union_shop/views/products_page.dart';
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        // Dynamic product route: /products/:id
        // if (settings.name != null && settings.name!.startsWith('/products/')) {
        //   final productId = settings.name!.substring('/products/'.length);
        //   return MaterialPageRoute(
        //     builder: (context) => ProductPage(productId: productId),
        //   );
        // }
        // Static routes
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const HomePage());
          case '/about':
            return MaterialPageRoute(builder: (context) => const AboutPage());
          case '/personalisation':
            return MaterialPageRoute(
                builder: (context) => const PrintShackAboutPage());
          case '/collections/halloween':
            return MaterialPageRoute(
                builder: (context) => const CollectionHalloweenPage());
          case '/collections/essential':
            return MaterialPageRoute(
                builder: (context) => const CollectionEssentialPage());
          case '/collections/portsmouth':
            return MaterialPageRoute(
                builder: (context) => const CollectionPortsmouthPage());
          case '/collections/pride':
            return MaterialPageRoute(
                builder: (context) => const CollectionPridePage());
          case '/collections/graduation':
            return MaterialPageRoute(
                builder: (context) => const CollectionGradPage());
          case '/collections/clothing':
            return MaterialPageRoute(
                builder: (context) => const CategoryClothingPage());
          case '/collections/merchandise':
            return MaterialPageRoute(
                builder: (context) => const CategoryMerchPage());
          case '/collections/sale':
            return MaterialPageRoute(builder: (context) => const SalePage());
          case '/products':
            return MaterialPageRoute(
                builder: (context) => const ProductsPage());
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
