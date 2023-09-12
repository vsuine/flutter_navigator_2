import 'package:flutter_application_1/data/auth/user_data.dart';
import 'package:flutter_application_1/data/utils/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final iFetchSessionProvider =
    Provider<IFetchSession>((ref) => throw UnimplementedError());

abstract class IFetchSession {
  Future<Result<UserData?>> fetchSession();
}
