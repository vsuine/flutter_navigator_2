// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/auth/session_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionInfo _$$_SessionInfoFromJson(Map<String, dynamic> json) =>
    _$_SessionInfo(
      idToken: json['IdToken'] as String,
      refreshToken: json['RefreshToken'] as String,
    );

Map<String, dynamic> _$$_SessionInfoToJson(_$_SessionInfo instance) =>
    <String, dynamic>{
      'IdToken': instance.idToken,
      'RefreshToken': instance.refreshToken,
    };
