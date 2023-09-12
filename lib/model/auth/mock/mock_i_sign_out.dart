import 'package:flutter_application_1/data/auth/user_data.dart';
import 'package:flutter_application_1/data/utils/result.dart';
import 'package:flutter_application_1/model/auth/i_sign_out.dart';

class MockISignOut implements ISignOut {
  @override
  Future<Result> signOut({UserData? userData}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(null);
  }
}
