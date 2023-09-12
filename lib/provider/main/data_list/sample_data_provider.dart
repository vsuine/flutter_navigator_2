import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/repository/sample_data_repository.dart';

/// family を使用して、id ごとの provider を定義できる
/// autoDispose で監視ものが消えれば自動で削除する
final sampleDataProvider = StateNotifierProvider.family
    .autoDispose<SampleDataNotifier, AsyncValue<SampleData>, String>(
  (ref, id) => SampleDataNotifier(
    ref,
    ref.read(sampleDataRepositoryProvider),
    id,
  ),
);

class SampleDataNotifier extends StateNotifier<AsyncValue<SampleData>> {
  SampleDataNotifier(
    this._ref,
    this._sampleDataRepository,
    this._id,
  ) : super(const AsyncLoading()) {
    // 初期化時に取得処理を呼び出す
    fetchData();
  }

  final StateNotifierProviderRef _ref;
  final SampleDataRepository _sampleDataRepository;
  final String _id;

  Future<void> fetchData() async {
    final sessionInfo = _ref.read(userDataProvider.notifier).sessionInfo;
    // 直前の状態を維持しながらデータを再取得
    // 完全に初期化したいなら refresh や invalidate を使う
    state = const AsyncLoading<SampleData>().copyWithPrevious(state);
    // guard でエラーハンドリングを簡単に
    state = await AsyncValue.guard<SampleData>(() async {
      final res = await _sampleDataRepository.fetchSampleData(sessionInfo, _id);
      return res.when(
        success: (data) => data,
        failure: (exception) => throw exception,
      );
    });
  }
}
