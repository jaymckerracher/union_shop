import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/navigation.dart';

void main() {
  testWidgets('navigateToAbout navigates to /about', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/about': (_) => const Text('About'),
      },
      home: const SizedBox(),
    ));
    navigateToAbout(tester.element(find.byType(SizedBox)));
    await tester.pumpAndSettle();
    expect(find.text('About'), findsOneWidget);
  });

  testWidgets('navigateToProduct navigates to /products/:id', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/products/123': (_) => const Text('Product 123'),
      },
      home: const SizedBox(),
    ));
    navigateToProduct(tester.element(find.byType(SizedBox)), '123');
    await tester.pumpAndSettle();
    expect(find.text('Product 123'), findsOneWidget);
  });

  testWidgets('navigateToLogin navigates to /login', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/login': (_) => const Text('Login'),
      },
      home: const SizedBox(),
    ));
    navigateToLogin(tester.element(find.byType(SizedBox)));
    await tester.pumpAndSettle();
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('navigateToHome navigates back to home from another route',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/', // Set initial route to home
      routes: {
        '/': (_) => const Text('Home'),
        '/about': (_) => const Text('About'),
      },
    ));
    // Navigate to /about
    navigateToAbout(tester.element(find.text('Home')));
    await tester.pumpAndSettle();
    expect(find.text('About'), findsOneWidget);

    // Now navigate back to home
    navigateToHome(tester.element(find.text('About')));
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);
  });
}
