import 'package:flutter_application_1/data/sample_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// SampleData を保存するクラスを公開する
///
/// ProviderScope の overrides で DI を行う
/// DIされなかった場合に UnimplementedError としておく。
final sampleDataPostProvider = Provider<ISampleDataPost>(
  (ref) => throw UnimplementedError(),
);

/// SampleData の保存を行うインターフェース
abstract class ISampleDataPost {
  Future<void> postSampleData(SampleData sampleData);
}
