import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/utils/verify_username.dart';

void main() {
  group('isValidUsername', () {
    test('returns true for valid usernames', () {
      expect(isValidUsername('username1'), isTrue);
      expect(isValidUsername('UserName8'), isTrue);
      expect(isValidUsername('A1B2C3D4'), isTrue);
      expect(isValidUsername('abcdefgh'), isTrue);
      expect(isValidUsername('12345678'), isTrue);
    });

    test('returns false for invalid usernames', () {
      expect(isValidUsername('user'), isFalse); // too short
      expect(isValidUsername('user!name'), isFalse); // special char
      expect(isValidUsername('user_name'), isFalse); // underscore
      expect(isValidUsername('user name'), isFalse); // space
      expect(isValidUsername(''), isFalse); // empty
      expect(isValidUsername('1234567'), isFalse); // too short
    });
  });
}
