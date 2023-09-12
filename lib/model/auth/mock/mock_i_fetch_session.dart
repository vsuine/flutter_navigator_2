import 'package:flutter_application_1/data/auth/session_info.dart';
import 'package:flutter_application_1/data/auth/user_data.dart';
import 'package:flutter_application_1/data/utils/result.dart';
import 'package:flutter_application_1/model/auth/i_fetch_session.dart';
import 'package:uuid/uuid.dart';

class MockIFetchSession implements IFetchSession {
  final _uuid = const Uuid();
  @override
  Future<Result<UserData?>> fetchSession() async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(
      UserData(
        id: _uuid.v4(),
        name: "Sample User",
        sessionInfo: const SessionInfo(
          idToken: "idToken",
          refreshToken: "refreshToken",
        ),
      ),
    );
  }
}
