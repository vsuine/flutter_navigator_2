import 'package:flutter_application_1/data/utils/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final iResetPasswordProvider =
    Provider<IResetPassword>((ref) => throw UnimplementedError());

abstract class IResetPassword {
  Future<Result> resetPassword(
    String email,
    String newPassword,
    String confirmNewPassword,
  );
}
