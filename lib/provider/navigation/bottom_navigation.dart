import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavigationStackProvider = StateNotifierProvider<
    BottomNavigationStateNotifier,
    List<BottomNavigationState>>((ref) => BottomNavigationStateNotifier());

class BottomNavigationStateNotifier
    extends StateNotifier<List<BottomNavigationState>> {
  BottomNavigationStateNotifier() : super([BottomNavigationState.home]);

  bool push(BottomNavigationState newValue) {
    // 現在と同じタブを選択したならスタックに積まない
    if (state.last == newValue) {
      return false;
    }
    state = [...state..add(newValue)];
    return true;
  }

  bool pop() {
    // 絶対にひとつは存在するようにする
    if (state.length == 1) {
      return false;
    }
    state = [...state..removeLast()];
    return true;
  }

  void clear() {
    state = [BottomNavigationState.home];
  }
}

enum BottomNavigationState {
  home(0),
  tabSample(1),
  dataList(2),
  setting(3);

  final int rawValue;
  const BottomNavigationState(this.rawValue);
  factory BottomNavigationState.from({required int rawValue}) {
    return BottomNavigationState.values.firstWhere(
      (element) => element.rawValue == rawValue,
      orElse: () => BottomNavigationState.home,
    );
  }
}

extension BottomNavigationStateIconExt on BottomNavigationState {
  Icon get icon {
    switch (this) {
      case BottomNavigationState.home:
        return const Icon(Icons.home);
      case BottomNavigationState.tabSample:
        return const Icon(Icons.tab);
      case BottomNavigationState.dataList:
        return const Icon(Icons.dataset);
      case BottomNavigationState.setting:
        return const Icon(Icons.settings);
    }
  }
}
