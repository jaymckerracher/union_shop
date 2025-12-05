import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/home_carousel.dart';

void main() {
  testWidgets('HomeCarousel displays first slide content',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: HomeCarousel()),
    ));
    // First slide title
    expect(find.text('Essential Range'), findsOneWidget);
    // First slide description
    expect(find.textContaining('Save over 20%'), findsOneWidget);
    // First slide button
    expect(find.text('View Range'), findsOneWidget);
    // Dots indicator
    expect(find.byType(Container), findsWidgets); // At least one dot
  });

  testWidgets('HomeCarousel can swipe to next slide',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: HomeCarousel()),
    ));
    // Swipe left to go to next slide
    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();
    // Second slide title
    expect(find.text('Classic Hoodie'), findsOneWidget);
    expect(find.text('Go To Product'), findsOneWidget);
  });

  testWidgets('HomeCarousel shows all slide titles when swiped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: HomeCarousel()),
    ));
    final titles = [
      'Essential Range',
      'Classic Hoodie',
      'Merchandise',
      'Print Shack',
    ];
    for (final title in titles) {
      expect(find.text(title), findsOneWidget);
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();
    }
  });

  testWidgets('HomeCarousel slide button is tappable',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: HomeCarousel()),
    ));
    final buttonFinder = find.text('View Range');
    expect(buttonFinder, findsOneWidget);
    await tester.tap(buttonFinder);
    // Navigation is triggered, but can't be verified without a mock
  });
}
