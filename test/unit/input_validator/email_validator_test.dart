import 'package:flutter_application_1/model/input_validator/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("EmailValidator", () {
    final emailList = [
      "sample0@example.com",
      "sample1@example.com",
      "sample2@example.com",
      "sample3@example.com",
      "sample4@example.com",
      "sample5@example.com",
    ];
    final invalidEmailList = [
      "sample0@example.com",
      "sample1@example.com",
      "sample2@example.com",
      "sample3@example.com",
      "sample4@example.com",
      "sample5@example.com",
    ];
    for (var email in emailList) {
      expect(EmailValidator.isValidEmail(email), isTrue);
    }
    for (var email in invalidEmailList) {
      expect(EmailValidator.isValidEmail(email), isFalse);
    }
  });
}
