import 'package:firebase_auth/firebase_auth.dart';

/// Signs up a user with email, password, and username using Firebase Auth.
/// Returns null on success, or an error message on failure.
Future<String?> signUpWithEmail({
  required String username,
  required String email,
  required String password,
}) async {
  try {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    await userCredential.user?.updateDisplayName(username.trim());
    return null; // Success
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      return 'This email is already in use.';
    } else if (e.code == 'weak-password') {
      return 'The password is too weak.';
    } else if (e.code == 'invalid-email') {
      return 'The email address is invalid.';
    } else {
      return 'Failed to create account: ${e.message}';
    }
  } catch (e) {
    return 'An error occurred: $e';
  }
}
