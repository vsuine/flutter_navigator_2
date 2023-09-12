import 'package:flutter_application_1/data/utils/network_result.dart';

class ApiException implements Exception {
  ApiException({this.message, this.networkResult});
  String? message;
  NetworkResult? networkResult;
  @override
  String toString() {
    return message ?? networkResult?.message ?? "UnknownException";
  }
}
