import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'generated/sample_data.freezed.dart';
part 'generated/sample_data.g.dart';

@freezed
class SampleData with _$SampleData {
  const factory SampleData({
    required String id,
    @Default(0) int counter,
  }) = _SampleData;
  factory SampleData.fromJson(Map<String, dynamic> json) =>
      _$SampleDataFromJson(json);
}
