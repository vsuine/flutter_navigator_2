import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/data/utils/result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  factory Result.success(T value) = Success<T>;
  factory Result.failure(Exception exception) = Failure<T>;
}
