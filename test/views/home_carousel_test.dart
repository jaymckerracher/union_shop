import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/home_carousel.dart';

/// Call this early in your test (before pumpWidget)
void useTestAssets() {
  // Ensure the test binding is initialized
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  // Intercept engine asset requests
  binding.defaultBinaryMessenger.setMockMessageHandler(
    'flutter/assets',
    (ByteData? message) async {
      if (message == null) return null;

      // The engine sends the key as bytes; decode to string
      final key = utf8.decode(message.buffer.asUint8List());

      // Map production path -> test file path
      // e.g. 'assets/images/logo.png' -> 'test/test_assets/images/logo.png'
      final testPath = key.replaceFirst('assets/', 'test/test_assets/');

      try {
        final bytes = await File(testPath).readAsBytes();
        // Return the bytes as ByteData for the engine
        return ByteData.view(bytes.buffer);
      } catch (e) {
        // If file not found, return null so engine thinks asset missing
        return null;
      }
    },
  );
}

void main() {
  group('HomeCarousel Widget Tests', () {
    testWidgets('renders carousel images', (WidgetTester tester) async {
      useTestAssets();
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: HomeCarousel()),
        ),
      );
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('renders carousel titles', (WidgetTester tester) async {
      useTestAssets();
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: HomeCarousel()),
        ),
      );
      expect(find.text('Essential Range'), findsOneWidget);
      await tester.drag(
          find.byType(PageView), const Offset(-400, 0)); // scroll right
      await tester.pumpAndSettle();
      expect(find.text('Classic Hoodie'), findsOneWidget);
      await tester.drag(
          find.byType(PageView), const Offset(-400, 0)); // scroll right
      await tester.pumpAndSettle();
      expect(find.text('Merchandise'), findsOneWidget);
      await tester.drag(
          find.byType(PageView), const Offset(-400, 0)); // scroll right
      await tester.pumpAndSettle();
      expect(find.text('Print Shack'), findsOneWidget);
    });

    testWidgets('renders carousel buttons', (WidgetTester tester) async {
      useTestAssets();
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: HomeCarousel()),
        ),
      );
      expect(find.text('View Range'), findsOneWidget);
      await tester.drag(
          find.byType(PageView), const Offset(-400, 0)); // scroll right
      await tester.pumpAndSettle();
      expect(find.text('Go To Product'), findsOneWidget);
      await tester.drag(
          find.byType(PageView), const Offset(-400, 0)); // scroll right
      await tester.pumpAndSettle();
      expect(find.text('View All Merch'), findsOneWidget);
      await tester.drag(
          find.byType(PageView), const Offset(-400, 0)); // scroll right
      await tester.pumpAndSettle();
      expect(find.text('Visit Shack'), findsOneWidget);

      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('renders carousel indicators', (WidgetTester tester) async {
      useTestAssets();
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: HomeCarousel()),
        ),
      );
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('scrolls to next image', (WidgetTester tester) async {
      useTestAssets();
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: HomeCarousel()),
        ),
      );
      await tester.drag(
          find.byType(PageView), const Offset(-400, 0)); // scroll right
      await tester.pumpAndSettle();
      expect(find.text('Classic Hoodie'), findsOneWidget);
    });
  });
}
