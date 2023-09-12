import 'package:flutter_application_1/data/utils/result.dart';
import 'package:flutter_application_1/model/auth/i_forgot_password.dart';

class MockIForgotPassword implements IForgotPassword {
  @override
  Future<Result> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(null);
  }
}
