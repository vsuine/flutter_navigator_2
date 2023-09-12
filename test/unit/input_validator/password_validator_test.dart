import 'package:flutter_application_1/model/input_validator/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("PasswordValidator", () {
    final passwordList = [
      "sample0@example.com",
      "sample1@example.com",
      "sample2@example.com",
      "sample3@example.com",
      "sample4@example.com",
      "sample5@example.com",
    ];
    final invalidPasswordList = [
      "sample0@example.com",
      "sample1@example.com",
      "sample2@example.com",
      "sample3@example.com",
      "sample4@example.com",
      "sample5@example.com",
    ];
    for (var email in passwordList) {
      expect(EmailValidator.isValidEmail(email), isTrue);
    }
    for (var email in invalidPasswordList) {
      expect(EmailValidator.isValidEmail(email), isFalse);
    }
  });
}
