bool isValidUsername(String username) {
  // Only allow letters and numbers, minimum 8 characters
  final usernameRegex = RegExp(r'^[a-zA-Z0-9]{8,}$');
  return usernameRegex.hasMatch(username);
}
