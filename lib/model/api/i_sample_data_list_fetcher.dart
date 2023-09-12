import 'package:flutter_application_1/data/sample_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// SampleData の一覧取得を行うクラスを公開する
///
/// ProviderScope の overrides で DI を行う
/// DIされなかった場合に UnimplementedError としておく。
final sampleDataListFetcherProvider = Provider<ISampleDataListFetcher>(
  (ref) => throw UnimplementedError(),
);

/// SampleData の一覧取得を行うインターフェース
abstract class ISampleDataListFetcher {
  Future<List<SampleData>> fetchSampleDataList(String idToken);
}
