import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/views/display_collection.dart';

// Test asset override (same as collections_page_test.dart)
void useTestAssets() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.defaultBinaryMessenger.setMockMessageHandler(
    'flutter/assets',
    (ByteData? message) async {
      if (message == null) return null;
      final key = utf8.decode(message.buffer.asUint8List());
      final testPath = key.replaceFirst('assets/', 'test/test_assets/');
      try {
        final bytes = await File(testPath).readAsBytes();
        return ByteData.view(bytes.buffer);
      } catch (e) {
        return null;
      }
    },
  );
}

class TestProduct {
  final String id;
  final String title;
  final double price;
  final double? originalPrice;
  final List<String> imageUrls;
  TestProduct({
    required this.id,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrls,
  });
}

void main() {
  testWidgets('DisplayCollection shows no products message when empty',
      (WidgetTester tester) async {
    useTestAssets();
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DisplayCollection(products: []),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('No products found.'), findsOneWidget);
  });

  testWidgets('DisplayCollection shows product grid with images and titles',
      (WidgetTester tester) async {
    useTestAssets();
    final products = [
      TestProduct(
        id: '1',
        title: 'Test Product',
        price: 19.99,
        originalPrice: 29.99,
        imageUrls: ['assets/images/classic_tee/black.webp'],
      ),
      TestProduct(
        id: '2',
        title: 'Another Product',
        price: 9.99,
        imageUrls: ['assets/images/classic_beanie/black.webp'],
      ),
    ];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DisplayCollection(products: products),
        ),
      ),
    );
    await tester.pumpAndSettle();
    // Check for product titles
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('Another Product'), findsOneWidget);
    // Check for images
    expect(find.byType(Image), findsWidgets);
    // Check for price and original price
    expect(find.text('£29.99'), findsOneWidget);
    expect(find.text('£19.99'), findsOneWidget);
    expect(find.text('£9.99'), findsOneWidget);
  });
}
