import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:union_shop/utils/firebase_check_user.dart';

// Create a MockFirebaseAuth using mockito
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

void main() {
  group('isUserSignedIn', () {
    test('returns true when user is signed in', () {
      final mockAuth = MockFirebaseAuth();
      final mockUser = MockUser();

      // Simulate a signed-in user
      when(mockAuth.currentUser).thenReturn(mockUser);

      expect(isUserSignedIn(mockAuth), isTrue);
    });

    test('returns false when no user is signed in', () {
      final mockAuth = MockFirebaseAuth();

      // Simulate no user signed in
      when(mockAuth.currentUser).thenReturn(null);

      expect(isUserSignedIn(mockAuth), isFalse);
    });
  });
}
