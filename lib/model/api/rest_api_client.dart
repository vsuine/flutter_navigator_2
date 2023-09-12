import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/model/api/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/http.dart';

import 'i_sample_data_list_fetcher.dart';
import 'i_sample_data_post.dart';
import 'i_sample_data_searcher.dart';
part '../../_generated/model/api/rest_api_client.g.dart';

/// シングルトンパターンとして DI するものを公開する
final restClientProvider = Provider(
  (ref) => RestApiClient(ref.read(dioProvider)),
);

/// RestAPI との通信の定義
///
/// Retrofit については https://pub.dev/documentation/retrofit/latest/
@RestApi(baseUrl: "https://localhost:8080/")
abstract class RestApiClient
    implements ISampleDataSearcher, ISampleDataListFetcher, ISampleDataPost {
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;
  static const _header = <String, dynamic>{"Content-Type": "application/json"};

  @override
  @GET("/sample-data/{id}")
  Future<SampleData> searchSampleData(
      @Path("id") String id, @Header("Authorization") String idToken);

  @override
  @GET("/sample-data")
  @Headers(_header)
  Future<List<SampleData>> fetchSampleDataList(
      @Header("Authorization") String idToken);

  @override
  @POST("/sample-data")
  Future<void> postSampleData(@Body() SampleData sampleData);
}
