import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/auth/session_info.dart';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/data/utils/network_result.dart';
import 'package:flutter_application_1/data/utils/result.dart';
import 'package:flutter_application_1/data/utils/unknown_exception.dart';
import 'package:flutter_application_1/model/api/i_sample_data_list_fetcher.dart';
import 'package:flutter_application_1/model/api/i_sample_data_post.dart';
import 'package:flutter_application_1/model/api/i_sample_data_searcher.dart';
import 'package:flutter_application_1/model/repository/api_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'sample_data_repository.dart';

final sampleDataRepositoryImplProvider =
    Provider<SampleDataRepositoryImpl>((ref) => SampleDataRepositoryImpl(
          ref.read(sampleDataListFetcherProvider),
          ref.read(sampleDataPostProvider),
          ref.read(sampleDataSearcherProvider),
        ));

class SampleDataRepositoryImpl implements SampleDataRepository {
  SampleDataRepositoryImpl(
    this._iSampleDataListFetcher,
    this._iSampleDataPost,
    this._iSampleDataSearcher,
  );

  final ISampleDataListFetcher _iSampleDataListFetcher;
  final ISampleDataPost _iSampleDataPost;
  final ISampleDataSearcher _iSampleDataSearcher;

  @override
  Future<Result<SampleData>> fetchSampleData(
    SessionInfo sessionInfo,
    String id,
  ) async {
    try {
      final result = await _iSampleDataSearcher.searchSampleData(
        id,
        sessionInfo.idToken,
      );
      return Result.success(result);
    } on DioException catch (dioException) {
      final statusCode = dioException.response?.statusCode;
      if (statusCode == null) return Result.failure(UnknownException());
      final apiException =
          ApiException(networkResult: NetworkResult.fromStatusCode(statusCode));
      return Result.failure(apiException);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Result<List<SampleData>>> fetchSampleDataList(
    SessionInfo sessionInfo,
  ) async {
    try {
      final result = await _iSampleDataListFetcher.fetchSampleDataList(
        sessionInfo.idToken,
      );
      return Result.success(result);
    } on DioException catch (dioException) {
      final statusCode = dioException.response?.statusCode;
      if (statusCode == null) return Result.failure(UnknownException());
      final apiException =
          ApiException(networkResult: NetworkResult.fromStatusCode(statusCode));
      return Result.failure(apiException);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Result<void>> postSampleData(SampleData sampleData) async {
    try {
      await _iSampleDataPost.postSampleData(sampleData);
      return Result.success(null);
    } on DioException catch (dioException) {
      final statusCode = dioException.response?.statusCode;
      if (statusCode == null) return Result.failure(UnknownException());
      final apiException =
          ApiException(networkResult: NetworkResult.fromStatusCode(statusCode));
      return Result.failure(apiException);
    } catch (error) {
      rethrow;
    }
  }
}
