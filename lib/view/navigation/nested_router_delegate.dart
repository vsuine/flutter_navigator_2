import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/bottom_navigation.dart';
import 'package:flutter_application_1/provider/navigation/navigate_triger_provider.dart';
import 'package:flutter_application_1/provider/navigation/selected_data_detail_stack.dart';
import 'package:flutter_application_1/provider/navigation/setting_navigation.dart';
import 'package:flutter_application_1/view/main_app/home_view.dart';
import 'package:flutter_application_1/view/main_app/sample_data_view.dart';
import 'package:flutter_application_1/view/main_app/setting_view.dart';
import 'package:flutter_application_1/view/main_app/tab_sample_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/view/navigation/route_path.dart';

class NestedRouterDelegate extends RouterDelegate<MainAppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MainAppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetRef _ref;

  NestedRouterDelegate(this._ref) : navigatorKey = GlobalKey<NavigatorState>() {
    _ref.listen(navigateTrigerProvider, (previous, next) {
      debugPrint('listen: nested navigateTrigerProvider');
      debugPrint('\t nested $previous');
      notifyListeners();
    });
  }

  @override
  Future<bool> popRoute() async {
    /// 戻るボタンが押された時の挙動、Web のブラウザバックは関係ない
    /// 基本は PopNavigatorRouterDelegateMixin を with で mixin する
    /// false を返すとアプリ全体をポップする、つまりアプリを閉じる
    /// 非同期処理を行わない場合は SynchronousFuture で返却すべき

    debugPrint('nested popRoute');
    final NavigatorState? navigator = navigatorKey.currentState;
    if (navigator == null) {
      return SynchronousFuture<bool>(false);
    }
    final canPopPage = await navigator.maybePop();
    if (canPopPage) {
      return true;
    }
    final bool canBackBottomNav =
        _ref.read(bottomNavigationStackProvider.notifier).pop();
    _ref.read(navigateTrigerProvider.notifier).navigate();
    return canBackBottomNav;
  }

  BottomNavigationState get _currentNavState =>
      _ref.read(bottomNavigationStackProvider.select((value) => value.last));

  @override
  Widget build(BuildContext context) {
    debugPrint('nested rebuild');
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentNavState == BottomNavigationState.home)
          const MaterialPage(child: HomeView()),
        if (_currentNavState == BottomNavigationState.tabSample)
          const MaterialPage(child: TabSampleView()),
        if (_currentNavState == BottomNavigationState.dataList)
          const MaterialPage(child: SampleDataListView()),
        if (_currentNavState == BottomNavigationState.dataList &&
            _ref.read(selectedSampleDataStackProvider).isNotEmpty)
          ..._ref
              .read(selectedSampleDataStackProvider)
              .map((e) => MaterialPage(child: SampleDataDetailView(id: e)))
              .toList(),
        if (_currentNavState == BottomNavigationState.setting)
          const MaterialPage(child: SettingView()),
        if (_currentNavState == BottomNavigationState.setting &&
            _ref.read(isOpenSettingDetailProvider))
          const MaterialPage(child: SettingPopUpView()),
      ],
      onPopPage: _onPopPage,
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    debugPrint('nested _onPopPage');
    if (!route.didPop(result)) return false;

    final currentBottomIndex =
        _ref.read(bottomNavigationStackProvider.select((value) => value.last));

    switch (currentBottomIndex) {
      case BottomNavigationState.home:
        break;
      case BottomNavigationState.tabSample:
        break;
      case BottomNavigationState.dataList:
        if (_ref.read(selectedSampleDataStackProvider
            .select((value) => value.isNotEmpty))) {
          _ref.read(selectedSampleDataStackProvider.notifier).pop();
          debugPrint(
              '\tcall navigate() in nested _onPopPage, bottom == dataList');
          _ref.read(navigateTrigerProvider.notifier).navigate();
          return true;
        }
        break;
      case BottomNavigationState.setting:
        if (_ref.read(isOpenSettingDetailProvider)) {
          _ref
              .read(isOpenSettingDetailProvider.notifier)
              .update((state) => false);
          debugPrint(
              '\tcall navigate() in nested _onPopPage, bottom == setting');
          _ref.read(navigateTrigerProvider.notifier).navigate();
          return true;
        }
        break;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(MainAppRoutePath configuration) async {
    /// ネストされたここでは setNewRoutePath は呼び出されない.
    debugPrint('nested setNewRoutePath');
    assert(false); // 仮に呼び出された場合にエラーを出すようにしておく
  }
}
