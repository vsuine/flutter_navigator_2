import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/data/navigation/main_navigation_state.dart';
import 'package:flutter_application_1/data/navigation/bottom_navigation_state.dart';
import 'package:flutter_application_1/data/navigation/sample_tab_bar_state.dart';
import 'package:flutter_application_1/data/navigation/route_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainNavigationStateNotifier extends StateNotifier<MainNavigationState> {
  MainNavigationStateNotifier()
      : super(MainNavigationState(mainRoutePath: MainRoutePath.home()));

  // final StateNotifierProviderRef _ref;
  final List<MainNavigationState> _history = [];

  // updateShouldNotifyで更新の通知方法を変えることもできる

  /// 前の状態に戻す。戻す状態があるなら true を返却する
  bool backMainRoutePath() {
    if (_history.isEmpty) {
      return false;
    }
    _history.removeLast();
    state = _history.isEmpty
        ? MainNavigationState(mainRoutePath: MainRoutePath.home())
        : _history.last;
    return _history.isNotEmpty;
  }

  /// [MainRoutePath] を用いて画面遷移に関する状態を更新する
  void updateMainRoutePathWithRoutePath(MainRoutePath mainRoutePath) {
    var bottomNavigationState = state.bottomNavigationState;
    var sampleTabBar = state.sampleTabBar;
    var isOpenSettingsPopup = state.isOpenSettingsPopup;
    var selectedSampleDataId = state.selectedSampleDataId;
    switch (mainRoutePath.runtimeType) {
      case HomePath:
        bottomNavigationState = BottomNavigationState.home;
        break;
      case TabSamplePath:
        bottomNavigationState = BottomNavigationState.tabSample;
        sampleTabBar = (mainRoutePath as TabSamplePath).sampleTabBar;
        break;
      case SampleDataListPath:
        bottomNavigationState = BottomNavigationState.dataList;
        selectedSampleDataId = null;
        break;
      case SampleDataDetailPath:
        bottomNavigationState = BottomNavigationState.dataList;
        selectedSampleDataId = (mainRoutePath as SampleDataDetailPath).id;
        break;
      case SettingPath:
        bottomNavigationState = BottomNavigationState.setting;
        isOpenSettingsPopup = false;
        break;
      case PopUpSettingPath:
        bottomNavigationState = BottomNavigationState.setting;
        isOpenSettingsPopup = true;
        break;
    }
    final newOne = state.copyWith(
      mainRoutePath: mainRoutePath,
      bottomNavigationState: bottomNavigationState,
      sampleTabBar: sampleTabBar,
      isOpenSettingsPopup: isOpenSettingsPopup,
      selectedSampleDataId: selectedSampleDataId,
    );
    if (kIsWeb == false) {
      _history.add(newOne);
    }
    state = newOne;
  }

  /// 画面遷移に関する状態を更新する
  void updateMainRoutePath({
    SampleTabBarState? sampleTabBar,
    BottomNavigationState? bottomNavigationState,
    String? selectedSampleDataId,
    bool? resetSelectedSampleData,
    bool? isOpenSettingsPopup,
  }) {
    bottomNavigationState ??= state.bottomNavigationState;
    sampleTabBar ??= state.sampleTabBar;
    isOpenSettingsPopup ??= state.isOpenSettingsPopup;
    if (resetSelectedSampleData != true) {
      selectedSampleDataId ??= state.selectedSampleDataId;
    }
    MainRoutePath mainRoutePath = MainRoutePath.home();
    switch (bottomNavigationState) {
      case BottomNavigationState.home:
        mainRoutePath = MainRoutePath.home();
        break;
      case BottomNavigationState.dataList:
        if (selectedSampleDataId == null) {
          mainRoutePath = MainRoutePath.sampleDataListPath();
          break;
        }
        mainRoutePath =
            MainRoutePath.sampleDataDetailPath(selectedSampleDataId);
        break;
      case BottomNavigationState.tabSample:
        mainRoutePath = MainRoutePath.tabSamplePath(sampleTabBar);
        break;
      case BottomNavigationState.setting:
        if (isOpenSettingsPopup) {
          mainRoutePath = MainRoutePath.popUpSettingPath();
          break;
        }
        mainRoutePath = MainRoutePath.settingPath();
        break;
      default:
        mainRoutePath = MainRoutePath.home();
    }
    final newOne = state.copyWith(
      mainRoutePath: mainRoutePath,
      bottomNavigationState: bottomNavigationState,
      sampleTabBar: sampleTabBar,
      isOpenSettingsPopup: isOpenSettingsPopup,
      selectedSampleDataId: selectedSampleDataId,
    );
    if (kIsWeb == false) {
      _history.add(newOne);
    }
    state = newOne;
  }
}

/// [MainNavigationStateNotifier] の provider
final mainNavigationStateProvider =
    StateNotifierProvider<MainNavigationStateNotifier, MainNavigationState>(
  (ref) => MainNavigationStateNotifier(),
);
