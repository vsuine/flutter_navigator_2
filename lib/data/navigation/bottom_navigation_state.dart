import 'package:flutter/material.dart';

enum BottomNavigationState {
  home(0),
  tabSample(1),
  dataList(2),
  setting(3),
  ;

  final int rawValue;
  const BottomNavigationState(this.rawValue);
  factory BottomNavigationState.from({required int rawValue}) {
    return BottomNavigationState.values.firstWhere(
      (element) => element.rawValue == rawValue,
      orElse: () => BottomNavigationState.home,
    );
  }

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
