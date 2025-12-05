import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:union_shop/utils/firebase_get_user.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

void main() {
  group('getCurrentUser', () {
    test('returns the current user when signed in', () {
      final mockAuth = MockFirebaseAuth();
      final mockUser = MockUser();
      when(mockAuth.currentUser).thenReturn(mockUser);
      expect(getCurrentUser(mockAuth), mockUser);
    });

    test('returns null when no user is signed in', () {
      final mockAuth = MockFirebaseAuth();
      when(mockAuth.currentUser).thenReturn(null);
      expect(getCurrentUser(mockAuth), isNull);
    });
  });
}
