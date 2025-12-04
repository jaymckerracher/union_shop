import 'package:firebase_auth/firebase_auth.dart';

/// Signs out the current user from Firebase Auth.
/// Returns null on success, or an error message on failure.
Future<String?> signOutUser() async {
  try {
    await FirebaseAuth.instance.signOut();
    return null; // Success
  } catch (e) {
    return 'Failed to sign out: $e';
  }
}
