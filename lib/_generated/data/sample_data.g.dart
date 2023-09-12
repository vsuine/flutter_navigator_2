// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../data/sample_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SampleData _$$_SampleDataFromJson(Map<String, dynamic> json) =>
    _$_SampleData(
      id: json['Id'] as String,
      title: json['Title'] as String,
      content: json['Content'] as String? ?? null,
    );

Map<String, dynamic> _$$_SampleDataToJson(_$_SampleData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Content': instance.content,
    };
