import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/model/api/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sampleDataProvider =
    StateNotifierProvider<SampleDataNotifier, AsyncValue<List<SampleData>>>(
        (ref) => SampleDataNotifier(ref));

class SampleDataNotifier extends StateNotifier<AsyncValue<List<SampleData>>> {
  SampleDataNotifier(this._ref) : super(const AsyncLoading()) {
    // 初期化時にローディングする
    fetchData();
  }

  final StateNotifierProviderRef _ref;

  Future<void> fetchData() async {
    // 直前の状態を維持しながらデータを再取得
    // 完全に初期化したいなら refresh や invalidate を使う
    state = const AsyncLoading<List<SampleData>>().copyWithPrevious(state);
    // guard でエラーハンドリングを簡単に
    state = await AsyncValue.guard(() async {
      return await _ref.read(apiClientProvider).fetchSampleList();
    });
  }
}
