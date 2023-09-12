import 'package:flutter_application_1/data/utils/result.dart';
import 'package:flutter_application_1/model/auth/i_sign_up_with_email_and_password.dart';

class MockISignUpWithEmailAndPassword implements ISignUpWithEmailAndPassword {
  @override
  Future<Result> signUpWithEmailAndPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(null);
  }
}
