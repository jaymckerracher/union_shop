import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/views/app_drawer.dart';

// import your app widget
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/views/footer.dart';
import 'package:union_shop/views/header.dart';

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
    useTestAssets();
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionsPage(),
      ),
    );
    await tester.pumpAndSettle();
    // Check for the Collections title
    expect(find.text('Collections'), findsOneWidget);
    // Check that at least one collection tile is rendered
    expect(find.byType(GestureDetector), findsWidgets);
    // Check that at least one image is rendered (if products exist)
    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('CollectionsPage displays the header and footer',
      (WidgetTester tester) async {
    useTestAssets();
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionsPage(),
      ),
    );
    await tester.pumpAndSettle();
    // Check for header and footer widgets
    expect(find.byType(Header), findsOneWidget);
    expect(find.byType(Footer), findsOneWidget);
  });

  testWidgets('CollectionsPage drawer is present', (WidgetTester tester) async {
    useTestAssets();
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionsPage(),
      ),
    );
    await tester.pumpAndSettle();
    // Open the drawer by tapping the menu (burger) icon
    final menuIcon = find.byIcon(Icons.menu);
    expect(menuIcon, findsOneWidget);
    await tester.tap(menuIcon);
    await tester.pumpAndSettle();
    // Now the AppDrawer should be present
    expect(find.byType(AppDrawer), findsOneWidget);
  });

  testWidgets('CollectionsPage displays collection labels',
      (WidgetTester tester) async {
    useTestAssets();
    await tester.pumpWidget(
      const MaterialApp(
        home: CollectionsPage(),
      ),
    );
    await tester.pumpAndSettle();
    // Example: check for a known label, adjust as needed
    expect(find.textContaining('Pride'), findsWidgets);
  });
}
