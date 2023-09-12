import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/repository/sample_data_repository.dart';

final sampleDataListProvider =
    StateNotifierProvider<SampleDataNotifier, AsyncValue<List<SampleData>>>(
  (ref) => SampleDataNotifier(
    ref,
    ref.read(sampleDataRepositoryProvider),
  ),
);

class SampleDataNotifier extends StateNotifier<AsyncValue<List<SampleData>>> {
  SampleDataNotifier(
    this._ref,
    this._sampleDataRepository,
  ) : super(const AsyncLoading()) {
    // 初期化時に取得処理を呼び出す
    fetchData();
  }

  final StateNotifierProviderRef _ref;
  final SampleDataRepository _sampleDataRepository;

  Future<void> fetchData() async {
    final sessionInfo = _ref.read(userDataProvider.notifier).sessionInfo;
    // 直前の状態を維持しながらデータを再取得
    // 完全に初期化したいなら refresh や invalidate を使う
    state = const AsyncLoading<List<SampleData>>().copyWithPrevious(state);
    // guard でエラーハンドリングを簡単に
    state = await AsyncValue.guard<List<SampleData>>(() async {
      final res = await _sampleDataRepository.fetchSampleDataList(sessionInfo);
      return res.when(
        success: (data) => data,
        failure: (exception) => throw exception,
      );
    });
  }
}
