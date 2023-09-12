import 'package:flutter_application_1/data/utils/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final iSignUpWithEmailAndPasswordProvider =
    Provider<ISignUpWithEmailAndPassword>((ref) => throw UnimplementedError());

abstract class ISignUpWithEmailAndPassword {
  Future<Result> signUpWithEmailAndPassword(
    String email,
    String password,
    String confirmPassword,
  );
}
