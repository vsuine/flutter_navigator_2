import 'package:flutter_application_1/data/auth/session_info.dart';
import 'package:flutter_application_1/data/auth/user_data.dart';
import 'package:flutter_application_1/data/utils/result.dart';
import 'package:flutter_application_1/model/auth/i_sign_in_with_email_and_password.dart';

class MockISignInWithEmailAndPassword implements ISignInWithEmailAndPassword {
  @override
  Future<Result<UserData>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(
      const UserData(
        id: "sample id",
        name: "sample user name",
        sessionInfo: SessionInfo(
          idToken: "id token",
          refreshToken: "refresh token",
        ),
      ),
    );
  }
}
