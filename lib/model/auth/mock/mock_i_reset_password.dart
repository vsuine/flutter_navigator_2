import 'package:flutter_application_1/data/utils/result.dart';
import 'package:flutter_application_1/model/auth/i_reset_password.dart';

class MockIResetPassword implements IResetPassword {
  @override
  Future<Result> resetPassword(
    String email,
    String newPassword,
    String confirmNewPassword,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(null);
  }
}
