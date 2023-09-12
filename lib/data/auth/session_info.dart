import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/data/auth/session_info.freezed.dart';
part '../../_generated/data/auth/session_info.g.dart';

@freezed
class SessionInfo with _$SessionInfo {
  const factory SessionInfo({
    required String idToken,
    required String refreshToken,
  }) = _SessionInfo;
  factory SessionInfo.fromJson(Map<String, dynamic> json) =>
      _$SessionInfoFromJson(json);
}
