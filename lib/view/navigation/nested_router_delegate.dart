import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/navigation/bottom_navigation_state.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/provider/navigation/main_navigation_state_notifier.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_application_1/view/main/home/home_view.dart';
import 'package:flutter_application_1/view/main/data_list/sample_data_view.dart';
import 'package:flutter_application_1/view/main/settings/pop_up_view.dart';
import 'package:flutter_application_1/view/main/settings/setting_view.dart';
import 'package:flutter_application_1/view/main/tab_sample/tab_sample_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/data/navigation/route_path.dart';

import '../main/data_list/sample_data_detail_view.dart';

class NestedRouterDelegate extends RouterDelegate<MainRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MainRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetRef _ref;

  NestedRouterDelegate(this._ref) : navigatorKey = GlobalKey<NavigatorState>() {
    _ref.listen(navigateTriggerProvider, (previous, next) {
      logger
          .finest('listen: nested navigateTriggerProvider $previous => $next');
      notifyListeners();
    });
  }

  /// 戻るボタンが押された時の挙動、Web のブラウザバックは関係ない。
  ///
  /// 基本は [PopNavigatorRouterDelegateMixin] を with で mixin する。
  /// false を返すとアプリ全体をポップする。つまりアプリを閉じる。
  ///
  /// 非同期処理を行わない場合は [SynchronousFuture] で返却すべき
  @override
  Future<bool> popRoute() async {
    logger.finest("nested popRoute");
    final NavigatorState? navigator = navigatorKey.currentState;
    if (navigator == null) {
      return SynchronousFuture<bool>(false);
    }
    final canPopPage = await navigator.maybePop();
    if (canPopPage) {
      return true;
    }
    bool canBack =
        _ref.read(mainNavigationStateProvider.notifier).backMainRoutePath();
    if (canBack) _ref.read(navigateTriggerProvider.notifier).navigate();
    return canBack;
  }

  BottomNavigationState get _currentBottomNavState =>
      _ref.read(mainNavigationStateProvider
          .select((value) => value.bottomNavigationState));

  @override
  Widget build(BuildContext context) {
    logger.finest("nested build");
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentBottomNavState == BottomNavigationState.home)
          const MaterialPage(child: HomeView()),
        if (_currentBottomNavState == BottomNavigationState.tabSample)
          const MaterialPage(child: TabSampleView()),
        if (_currentBottomNavState == BottomNavigationState.dataList)
          const MaterialPage(child: SampleDataListView()),
        if (_currentBottomNavState == BottomNavigationState.dataList &&
            _ref.read(mainNavigationStateProvider
                    .select((value) => value.selectedSampleDataId)) !=
                null)
          MaterialPage(
            child: SampleDataDetailView(
                id: _ref.read(mainNavigationStateProvider
                    .select((value) => value.selectedSampleDataId!))),
          ),
        if (_currentBottomNavState == BottomNavigationState.setting)
          const MaterialPage(child: SettingView()),
        if (_currentBottomNavState == BottomNavigationState.setting &&
            _ref.read(mainNavigationStateProvider
                .select((value) => value.isOpenSettingsPopup)))
          const SettingPopUpViewPage(),
      ],
      onPopPage: _onPopPage,
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    logger.finest("nested _onPopPage");
    if (!route.didPop(result)) return false;

    final currentBottomIndex = _ref.read(
      mainNavigationStateProvider
          .select((value) => value.bottomNavigationState),
    );

    switch (currentBottomIndex) {
      case BottomNavigationState.home:
        _ref.read(mainNavigationStateProvider.notifier).backMainRoutePath();
        return true;
      case BottomNavigationState.tabSample:
        _ref.read(mainNavigationStateProvider.notifier).backMainRoutePath();
        return true;
      case BottomNavigationState.dataList:
        if (_ref.read(mainNavigationStateProvider
                .select((value) => value.selectedSampleDataId)) !=
            null) {
          _ref.read(mainNavigationStateProvider.notifier).updateMainRoutePath(
              selectedSampleDataId: null, resetSelectedSampleData: true);
          _ref.read(navigateTriggerProvider.notifier).navigate();
          return true;
        } else {
          _ref.read(mainNavigationStateProvider.notifier).backMainRoutePath();
          return true;
        }
      case BottomNavigationState.setting:
        if (_ref.read(mainNavigationStateProvider
            .select((value) => value.isOpenSettingsPopup))) {
          _ref
              .read(mainNavigationStateProvider.notifier)
              .updateMainRoutePath(isOpenSettingsPopup: false);
          _ref.read(navigateTriggerProvider.notifier).navigate();
          return true;
        }
        break;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(MainRoutePath configuration) async {
    /// ネストされたここでは setNewRoutePath は呼び出されない.
    logger.finest("nested setNewRoutePath");
    assert(false); // 仮に呼び出された場合にエラーを出すようにしておく
  }
}
