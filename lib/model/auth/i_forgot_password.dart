import 'package:flutter_application_1/data/utils/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final iForgotPasswordProvider =
    Provider<IForgotPassword>((ref) => throw UnimplementedError());

abstract class IForgotPassword {
  Future<Result> forgotPassword(
    String email,
  );
}
