import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/verify_password.dart';

void main() {
  group('isValidPassword', () {
    test('returns true for passwords with 8 or more characters', () {
      expect(isValidPassword('password'), isTrue);
      expect(isValidPassword('12345678'), isTrue);
      expect(isValidPassword('abcdefgh'), isTrue);
      expect(isValidPassword('aVeryLongPassword123!'), isTrue);
    });

    test('returns false for passwords with less than 8 characters', () {
      expect(isValidPassword(''), isFalse);
      expect(isValidPassword('1234567'), isFalse);
      expect(isValidPassword('abcdefg'), isFalse);
      expect(isValidPassword('short1'), isFalse);
    });
  });
}
