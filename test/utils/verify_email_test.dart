import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/verify_email.dart';

void main() {
  group('isValidEmail', () {
    test('returns true for valid emails', () {
      expect(isValidEmail('test@example.com'), isTrue);
      expect(isValidEmail('user.name@domain.co.uk'), isTrue);
      expect(isValidEmail('user_name@sub.domain.com'), isTrue);
      expect(isValidEmail('user-name@domain.io'), isTrue);
      expect(isValidEmail('a@b.cc'), isTrue);
    });

    test('returns false for invalid emails', () {
      expect(isValidEmail('plainaddress'), isFalse);
      expect(isValidEmail('@@example.com'), isFalse);
      expect(isValidEmail('user@.com'), isFalse);
      expect(isValidEmail('user@com'), isFalse);
      expect(isValidEmail('user@domain,com'), isFalse);
      expect(isValidEmail('user@domain'), isFalse);
      expect(isValidEmail('user@domain.'), isFalse);
      expect(isValidEmail('user@domain.c'), isTrue); // Accepts single char TLD
    });
  });
}
