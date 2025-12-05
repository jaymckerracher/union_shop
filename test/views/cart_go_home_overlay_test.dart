import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/views/cart_go_home_overlay.dart';
import 'package:union_shop/view_models/cart_view_model.dart';
import 'package:union_shop/utils/firebase_get_user.dart' as user_utils;

class MockCartViewModel extends CartViewModel {
  bool cleared = false;
  String? clearedUid;

  @override
  void clearCartFirebase(String uid) {
    cleared = true;
    clearedUid = uid;
  }
}

class FakeUser {
  final String uid;
  FakeUser(this.uid);
}

void main() {
  testWidgets('CartGoHomeOverlay displays success UI',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<CartViewModel>.value(
          value: MockCartViewModel(),
          child: const CartGoHomeOverlay(),
        ),
      ),
    );

    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(find.text('Purchase Successful!'), findsOneWidget);
    expect(find.text('Go back to home'), findsOneWidget);
    expect(find.text('Go Home'), findsOneWidget);
  });
}

class CartGoHomeOverlayWithMockNavigation extends StatelessWidget {
  final VoidCallback onNavigate;
  const CartGoHomeOverlayWithMockNavigation(
      {super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 24),
            const Text(
              'Purchase Successful!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Go back to home',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final uid = user_utils.getCurrentUser()?.uid;
                  if (uid != null) {
                    cartViewModel.clearCartFirebase(uid);
                  }
                  onNavigate();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Go Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
