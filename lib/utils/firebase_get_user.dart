import 'package:firebase_auth/firebase_auth.dart';

/// Returns the current signed-in Firebase user, or null if not signed in.
User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}
