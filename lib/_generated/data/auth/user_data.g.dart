// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/auth/user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      id: json['Id'] as String,
      name: json['Name'] as String,
      sessionInfo:
          SessionInfo.fromJson(json['SessionInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'SessionInfo': instance.sessionInfo,
    };
