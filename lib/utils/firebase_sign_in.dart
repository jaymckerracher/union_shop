import 'package:firebase_auth/firebase_auth.dart';

/// Signs in a user with email and password using Firebase Auth.
/// Returns null on success, or an error message on failure.
Future<String?> signInWithEmail({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return null; // Success
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Incorrect password.';
    } else if (e.code == 'invalid-email') {
      return 'The email address is invalid.';
    } else {
      return 'Failed to sign in: ${e.message}';
    }
  } catch (e) {
    return 'An error occurred: $e';
  }
}
