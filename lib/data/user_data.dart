import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'generated/user_data.freezed.dart';
part 'generated/user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String name,
  }) = _UserData;
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
