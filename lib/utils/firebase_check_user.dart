import 'package:firebase_auth/firebase_auth.dart';

/// Returns true if a user is currently signed in, false otherwise.
bool isUserSignedIn([FirebaseAuth? auth]) {
  final instance = auth ?? FirebaseAuth.instance;
  return instance.currentUser != null;
}
