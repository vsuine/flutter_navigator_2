import 'package:flutter_application_1/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// navigate()することで状態を遷移させる
///
/// 一度の遷移で複数の状態を更新する場合に
/// 画面再構築処理が画面遷移に関する状態の数だけ走ることになる
/// 状態を更新しつつ画面遷移を行わない場合にも有用
///
/// ナビゲーションに関する状態が複数あるならこのような Provider を用意しておくと
/// 無駄な処理が減らせる
final navigateTriggerProvider =
    StateNotifierProvider<NavigateTriggerNotifier, bool>(
        (ref) => NavigateTriggerNotifier());

class NavigateTriggerNotifier extends StateNotifier<bool> {
  NavigateTriggerNotifier() : super(false);
  void navigate() {
    logger.finest("navigate is called");
    state = !state;
  }
}
