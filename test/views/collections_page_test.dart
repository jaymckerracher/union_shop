import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

// import your app widget
import 'package:union_shop/views/collections_page.dart';

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
  testWidgets('widget loads image from test assets',
      (WidgetTester tester) async {
    // 1) Setup test asset handler BEFORE pumping any widgets
    useTestAssets();

    // 2) Build your widget (which uses Image.asset('assets/images/logo.png'))
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );

    // Allow one frame to render and for the image to be decoded
    await tester.pumpAndSettle();

    // 3) Assertions: find the Image widget
    expect(find.byType(Image), findsOneWidget);
  });
}
