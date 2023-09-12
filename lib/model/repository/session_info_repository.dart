import 'package:flutter_application_1/data/auth/session_info.dart';
import 'package:flutter_application_1/data/utils/result.dart';

abstract class SessionInfoRepository {
  Future<Result<SessionInfo>> fetchSessionInfo() async {
    return Result.failure(Exception());
  }
}
