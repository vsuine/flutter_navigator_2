import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_1/model/utils/network_exceptions.dart';

part 'generated/result.freezed.dart';

/// Rust lang のようにエラーハンドリングを楽にするためのクラス
@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(NetworkExceptions networkExceptions) =
      Failure<T>;
}
