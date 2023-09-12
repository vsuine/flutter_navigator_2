import 'package:flutter_application_1/data/auth/user_data.dart';
import 'package:flutter_application_1/data/utils/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final iSignInWithEmailAndPasswordProvider =
    Provider<ISignInWithEmailAndPassword>((ref) => throw UnimplementedError());

abstract class ISignInWithEmailAndPassword {
  Future<Result<UserData>> signInWithEmailAndPassword(
    String email,
    String password,
  );
}
