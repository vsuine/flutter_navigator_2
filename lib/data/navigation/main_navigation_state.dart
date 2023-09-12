import 'package:flutter_application_1/data/navigation/bottom_navigation_state.dart';
import 'package:flutter_application_1/data/navigation/sample_tab_bar_state.dart';
import 'package:flutter_application_1/data/navigation/route_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/data/navigation/main_navigation_state.freezed.dart';

@freezed
class MainNavigationState with _$MainNavigationState {
  const factory MainNavigationState({
    @Default(SampleTabBarState.tab01) SampleTabBarState sampleTabBar,
    @Default(BottomNavigationState.home)
    BottomNavigationState bottomNavigationState,
    @Default(false) bool isOpenSettingsPopup,
    @Default(null) String? selectedSampleDataId,
    required MainRoutePath mainRoutePath,
  }) = _MainNavigationState;
}
