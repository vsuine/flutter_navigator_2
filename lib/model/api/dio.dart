import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Dio のインスタンスを公開する
final dioProvider = Provider<Dio>((_) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor()); // 追加してコンソールにログを出力する
  return dio;
});
