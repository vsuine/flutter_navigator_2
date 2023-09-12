import 'package:email_validator/email_validator.dart' as e;

class EmailValidator {
  static bool isValidEmail(String? email) {
    if (email == null) return false;
    return e.EmailValidator.validate(email);
  }
}
