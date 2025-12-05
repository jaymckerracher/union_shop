import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/header.dart';

void main() {
  testWidgets('Header displays banner text', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: Header()),
    ));
    expect(find.text(Header.bannerText), findsOneWidget);
  });

  testWidgets('Header logo is tappable and present',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: Header()),
    ));
    final logoFinder = find.byType(Image);
    expect(logoFinder, findsOneWidget);
    await tester.tap(logoFinder);
    // Navigation is triggered, but we can't verify navigation in a unit test without a mock
  });

  testWidgets('Header shows wide layout navigation buttons', (tester) async {
    final oldConfig = tester.binding.renderView.configuration;
    tester.binding.renderView.configuration = TestViewConfiguration(
      size: const Size(1001, 300),
    );
    addTearDown(() {
      tester.binding.renderView.configuration = oldConfig;
    });

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            constraints:
                const BoxConstraints.tightFor(width: 1001, height: 300),
            child: const Header(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('Clothing'), findsOneWidget);
    expect(find.text('Merch'), findsOneWidget);
    expect(find.text('Sale'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
  });

  testWidgets('Header shows compact layout icons', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 400, // Narrow screen
          child: Header(),
        ),
      ),
    ));
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });
}
