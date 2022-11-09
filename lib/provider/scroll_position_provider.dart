import 'package:hooks_riverpod/hooks_riverpod.dart';

// スクロール位置を保持し、画面遷移から戻ってきたときに復元する

final homeViewScrollPositionProvider = StateProvider<double>((ref) => 0.0);

final tabSampleSubViewScrollPosition = StateProvider<double>((ref) => 0.0);

final dataListScrollPositionProvider = StateProvider<double>((ref) => 0.0);
