import 'package:flutter_application_1/data/auth/session_info.dart';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/data/utils/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sampleDataRepositoryProvider = Provider<SampleDataRepository>(
  (ref) => throw UnimplementedError(),
);

abstract class SampleDataRepository {
  Future<Result<SampleData>> fetchSampleData(
    SessionInfo sessionInfo,
    String id,
  );
  Future<Result<List<SampleData>>> fetchSampleDataList(
    SessionInfo sessionInfo,
  );
  Future<Result<void>> postSampleData(SampleData sampleData);
}
