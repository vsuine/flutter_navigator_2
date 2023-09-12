import 'package:hooks_riverpod/hooks_riverpod.dart';

// スクロール位置を保持し、画面遷移から戻ってきたときに復元する
final tabSampleSubViewScrollPositionProvider =
    StateProvider<double>((ref) => 0.0);
final dataListScrollPositionProvider = StateProvider<double>((ref) => 0.0);

// 外部からスクロール位置を変更するときにトリガーを引く
// 例えば BottomNavigation を選択した時にスクロール位置を初期値にするなど
final initTabSampleSubViewScrollPosition = StateProvider<bool>((ref) => false);
final initDataListScrollPositionProvider = StateProvider<bool>((ref) => false);
