import 'package:flutter_application_1/data/sample_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// SampleData の検索を行うクラスを公開する
///
/// ProviderScope の overrides で DI を行う
/// DIされなかった場合に UnimplementedError としておく。
final sampleDataSearcherProvider = Provider<ISampleDataSearcher>((ref) {
  throw UnimplementedError();
});

/// SampleData の検索を行うインターフェース
abstract class ISampleDataSearcher {
  Future<SampleData> searchSampleData(String id, String idToken);
}
