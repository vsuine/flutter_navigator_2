import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation.dart';
import 'package:flutter_application_1/provider/navigation/bottom_navigation.dart';
import 'package:flutter_application_1/provider/navigation/navigate_triger_provider.dart';
import 'package:flutter_application_1/provider/navigation/sample_tabbar_navigation.dart';
import 'package:flutter_application_1/provider/navigation/selected_data_detail_stack.dart';
import 'package:flutter_application_1/provider/navigation/setting_navigation.dart';
import 'package:flutter_application_1/view/auth/forgot_password_view.dart';
import 'package:flutter_application_1/view/auth/login_view.dart';
import 'package:flutter_application_1/view/auth/reset_password_view.dart';
import 'package:flutter_application_1/view/auth/signup_view.dart';
import 'package:flutter_application_1/view/navigation/fetching_page.dart';
import 'package:flutter_application_1/view/navigation/main_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/view/navigation/route_path.dart';

/// [RouterDelegate] は 渡された設定に基づいて状態を復元する役割
class MainRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetRef _ref;

  MainRouterDelegate(this._ref) : navigatorKey = GlobalKey<NavigatorState>() {
    _ref.listen(navigateTrigerProvider, (previous, next) {
      debugPrint('listen: navigateTrigerProvider');
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
    debugPrint('popRoute');

    // 基本機能は PopNavigatorRouterDelegateMixin が提供するので override しなくてもいい
    // PopNavigatorRouterDelegateMixin が提供するのは以下
    final NavigatorState? navigator = navigatorKey.currentState;
    if (navigator == null) {
      return SynchronousFuture<bool>(false);
    }
    return navigator.maybePop();
    // maybePop は Navigator の pages stack がなくなるまでポップする
    // stack がなくなったら false が返る
    // stack がなくても戻るボタンでアプリを閉じてほしくない場合
    // 例えば bottom navigation bar でタブ移動の履歴をたどるような場合には向かない
  }

  /// [Router] が再構築によって経路情報が変更された可能性を検出したときに呼び出される.
  /// 現在のアプリの状態から [RoutePath] を返す
  @override
  RoutePath? get currentConfiguration {
    debugPrint('currentConfiguration');
    if (_ref.read(authNavigationProvider).isFetchingSession) {
      return FetchingSessionPath('');
    }
    if (_ref.read(authNavigationProvider).isLoggedIn == false) {
      if (_ref.read(authNavigationProvider).isOpenResetPasswordPage) {
        return ResetPasswordPath();
      } else if (_ref.read(authNavigationProvider).isOpenForgotPasswordPage) {
        return ForgotPasswordPath();
      } else if (_ref.read(authNavigationProvider).isOpenSignUpPage) {
        return SignUpPath();
      }
      return LoginPath();
    }
    final currentBottomNav =
        _ref.read(bottomNavigationStackProvider.select((value) => value.last));
    switch (currentBottomNav) {
      case BottomNavigationState.home:
        return HomePath();
      case BottomNavigationState.tabSample:
        return TabSamplePath(_ref.read(sampleTabProvider));
      case BottomNavigationState.dataList:
        if (_ref.read(selectedSampleDataStackProvider
            .select((value) => value.isNotEmpty))) {
          return SampleDataDetailPath(_ref.read(
              selectedSampleDataStackProvider.select((value) => value.last)));
        }
        return SampleDataListPath();
      case BottomNavigationState.setting:
        if (_ref.read(isOpenSettingDetailProvider)) {
          return UserSettingPath();
        }
        return SettingPath();
      default:
        return HomePath();
    }
  }

  bool get _isLoggedIn =>
      _ref.read(authNavigationProvider.select((value) => value.isLoggedIn));

  /// 状態によって [Widget] を切り替える [Navigator] を返す
  /// notifyListeners が呼び出された後に実行される
  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild');
    return Navigator(
        key: navigatorKey,
        pages: [
          if (_isLoggedIn == false) const MaterialPage(child: LoginView()),
          if (_isLoggedIn == false &&
              _ref.read(authNavigationProvider
                  .select((value) => value.isOpenSignUpPage)))
            const MaterialPage(child: SignupView()),
          if (_isLoggedIn == false &&
              _ref.read(authNavigationProvider
                  .select((value) => value.isOpenForgotPasswordPage)))
            const MaterialPage(child: ForgotPasswordView()),
          if (_isLoggedIn == false &&
              _ref.read(authNavigationProvider
                  .select((value) => value.isOpenResetPasswordPage)))
            const MaterialPage(child: ResetPasswordView()),
          if (_isLoggedIn == false &&
              _ref.read(authNavigationProvider
                  .select((value) => value.isFetchingSession)))
            const FetchLoadingPage(),
          if (_isLoggedIn) const MaterialPage(child: MainApp()),
        ],
        onPopPage: _onPopPage);
  }

  /// [Navigator.pop] のコールバック関数.
  /// AppBar の pop 用ボタン押下時など
  ///
  /// Web の ブラウザバックは該当しない
  /// ブラウザバックは [RouteInformationParser.parseRouteInformation] が走る
  bool _onPopPage(Route<dynamic> route, dynamic result) {
    debugPrint('_onPopPage');
    debugPrint('\t${route.runtimeType}');
    if (!route.didPop(result)) return false;

    final nav = _ref.read(authNavigationProvider);
    final navController = _ref.read(authNavigationProvider.notifier);
    if (nav.isOpenResetPasswordPage) {
      navController.setOpenResetPasswordPage(false);
    } else if (nav.isOpenForgotPasswordPage) {
      navController.setOpenForgotPasswordPage(false);
    } else if (nav.isOpenSignUpPage) {
      navController.setOpenSignUpPage(false);
    } else {
      return false;
    }
    _ref.read(navigateTrigerProvider.notifier).navigate();
    return true;
  }

  /// [RouteInformationParser.parseRouteInformation] で解析された [RoutePath] から状態を更新する
  ///
  /// [setNewRoutePath] の後に notifyListerners を呼び出すべき
  /// 非同期処理を行わない場合 [SynchronousFuture] で返却すべき
  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    debugPrint('setNewRoutePath');
    debugPrint('\tget: ${configuration.runtimeType}');

    if (configuration is LoginPath) {
      _ref.read(authNavigationProvider.notifier).setOpenSignUpPage(false);
      _ref
          .read(authNavigationProvider.notifier)
          .setOpenForgotPasswordPage(false);
      _ref
          .read(authNavigationProvider.notifier)
          .setOpenResetPasswordPage(false);
    } else if (configuration is SignUpPath) {
      _ref.read(authNavigationProvider.notifier).setOpenSignUpPage(true);
      _ref
          .read(authNavigationProvider.notifier)
          .setOpenForgotPasswordPage(false);
      _ref
          .read(authNavigationProvider.notifier)
          .setOpenResetPasswordPage(false);
    } else if (configuration is ForgotPasswordPath) {
      _ref.read(authNavigationProvider.notifier).setOpenSignUpPage(false);
      _ref
          .read(authNavigationProvider.notifier)
          .setOpenForgotPasswordPage(true);
      _ref
          .read(authNavigationProvider.notifier)
          .setOpenResetPasswordPage(false);
    } else if (configuration is ResetPasswordPath) {
      _ref.read(authNavigationProvider.notifier).setOpenSignUpPage(false);
      _ref
          .read(authNavigationProvider.notifier)
          .setOpenForgotPasswordPage(true);
      _ref.read(authNavigationProvider.notifier).setOpenResetPasswordPage(true);
    } else if (configuration is HomePath) {
      _ref
          .read(bottomNavigationStackProvider.notifier)
          .push(BottomNavigationState.home);
    } else if (configuration is TabSamplePath) {
      _ref
          .read(bottomNavigationStackProvider.notifier)
          .push(BottomNavigationState.tabSample);
      _ref
          .read(sampleTabProvider.notifier)
          .update((state) => configuration.sampleTabBar);
    } else if (configuration is SampleDataListPath) {
      _ref
          .read(bottomNavigationStackProvider.notifier)
          .push(BottomNavigationState.dataList);
      _ref.read(selectedSampleDataStackProvider.notifier).clear();
    } else if (configuration is SampleDataDetailPath) {
      _ref
          .read(bottomNavigationStackProvider.notifier)
          .push(BottomNavigationState.dataList);
      _ref
          .read(selectedSampleDataStackProvider.notifier)
          .push(configuration.id);
    } else if (configuration is SettingPath) {
      _ref
          .read(bottomNavigationStackProvider.notifier)
          .push(BottomNavigationState.setting);
      _ref.read(isOpenSettingDetailProvider.notifier).update((state) => false);
    } else if (configuration is UserSettingPath) {
      _ref
          .read(bottomNavigationStackProvider.notifier)
          .push(BottomNavigationState.setting);
      _ref.read(isOpenSettingDetailProvider.notifier).update((state) => true);
    }
    debugPrint('\t call navigate() in setNewRoutePath');
    _ref.read(navigateTrigerProvider.notifier).navigate();
    return SynchronousFuture<void>(null);
  }

  // @override
  // Future<void> setRestoredRoutePath(RoutePath configuration) {
  //   /// 状態の復元中に Router によって呼び出される
  //   return setNewRoutePath(configuration); // デフォルト
  // }

  /// アプリ起動時にのみ呼び出される状態更新処理
  @override
  Future<void> setInitialRoutePath(RoutePath configuration) async {
    debugPrint('setInitialRoutePath');
    return SynchronousFuture<void>(null);
    // return super.setInitialRoutePath(configuration);
  }
}
