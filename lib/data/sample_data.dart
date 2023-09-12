import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../_generated/data/sample_data.freezed.dart';
part '../_generated/data/sample_data.g.dart';

@freezed
class SampleData with _$SampleData {
  const factory SampleData({
    required String id,
    required String title,
    @Default(null) String? content,
  }) = _SampleData;
  factory SampleData.fromJson(Map<String, dynamic> json) =>
      _$SampleDataFromJson(json);
}
