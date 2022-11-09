import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/model/api/mock_api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';

part 'generated/api_service.g.dart';

final apiClientProvider = Provider((ref) => MockApiService());

// api との接続と結果の取得を retrofit に任せる
@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/sample/{id}')
  Future<SampleData> fetchSample(@Path("id") String id);

  @GET('/sample-list')
  Future<List<SampleData>> fetchSampleList();
}
