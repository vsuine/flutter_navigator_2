import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/navigation/main_navigation_state_notifier.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_application_1/provider/session_timeout_provider.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:flutter_application_1/view/auth/forgot_password_view.dart';
import 'package:flutter_application_1/view/auth/login_view.dart';
import 'package:flutter_application_1/view/auth/reset_password_view.dart';
import 'package:flutter_application_1/view/auth/sign_up_view.dart';
import 'package:flutter_application_1/view/navigation/main_app.dart';
import 'package:flutter_application_1/view/navigation/session_timeout_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/data/navigation/route_path.dart';

/// [RouterDelegate] は 渡された設定に基づいて状態を復元する役割
class MainRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetRef _ref;

  MainRouterDelegate(this._ref) : navigatorKey = GlobalKey<NavigatorState>() {
    // navigateTriggerProvider を監視し、変更があった際に再描画処理を行う
    _ref.listen(navigateTriggerProvider, (previous, next) {
      logger.finest("listen: navigateTriggerProvider $previous => $next");
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
    logger.finest("popRoute");
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

  /// 現在のアプリの状態から [RoutePath] を返す
  ///
  /// [Router] が再構築によって経路情報が変更された可能性を検出したときに呼び出される.
  ///
  /// 現在のアプリの状態は _ref によって読み取る
  @override
  RoutePath? get currentConfiguration {
    logger.finest("currentConfiguration");
    if (_isLoggedIn) {
      return _ref.read(mainNavigationStateProvider).mainRoutePath;
    }
    return _ref.read(authNavigationStateProvider).authRoutePath;
  }

  bool get _isLoggedIn => _ref.read(userDataProvider).when(
      data: (data) => data != null,
      error: (_, __) => false,
      loading: () => false);

  /// 状態によって [Widget] を切り替える [Navigator] を返す
  /// notifyListeners が呼び出された後に実行される
  ///
  /// _ref.watch() としないのは 再描画が必要だと判断するのは
  /// ChangeNotifier の notifyListeners であるため
  @override
  Widget build(BuildContext context) {
    logger.finest("build");
    return Navigator(
      key: navigatorKey,
      pages: [
        // 下にいくほどレイヤーが上で画面が描画される
        if (_isLoggedIn == false) const MaterialPage(child: LoginView()),
        if (_isLoggedIn == false &&
            _ref.read(authNavigationStateProvider
                .select((value) => value.isOpenSignUpPage)))
          const MaterialPage(child: SignUpView()),
        if (_isLoggedIn == false &&
            _ref.read(authNavigationStateProvider
                .select((value) => value.isOpenForgotPasswordPage)))
          const MaterialPage(child: ForgotPasswordView()),
        if (_isLoggedIn == false &&
            _ref.read(authNavigationStateProvider
                .select((value) => value.isOpenResetPasswordPage)))
          const MaterialPage(child: ResetPasswordView()),
        if (_isLoggedIn) const MaterialPage(child: MainApp()),
        if (_ref.read(isSessionTimeoutProvider)) const SessionTimeoutPage(),
      ],
      onPopPage: _onPopPage,
    );
  }

  /// [Navigator.pop] のコールバック関数.
  /// AppBar の pop 用ボタン ( ← のようなもの ) 押下時など
  ///
  /// Web の ブラウザバックは該当しない
  /// ブラウザバックは [RouteInformationParser.parseRouteInformation] が走る
  bool _onPopPage(Route<dynamic> route, dynamic result) {
    logger.finest("_onPopPage: ${route.runtimeType}");
    if (!route.didPop(result)) return false;

    final nav = _ref.read(authNavigationStateProvider);
    final navController = _ref.read(authNavigationStateProvider.notifier);
    if (nav.isOpenResetPasswordPage) {
      navController.updateAuthRoutePath(AuthRoutePath.forgotPassword());
    } else if (nav.isOpenForgotPasswordPage) {
      navController.updateAuthRoutePath(AuthRoutePath.login());
    } else if (nav.isOpenSignUpPage) {
      navController.updateAuthRoutePath(AuthRoutePath.login());
    } else {
      return false;
    }
    _ref.read(navigateTriggerProvider.notifier).navigate();
    return true;
  }

  /// [RouteInformationParser.parseRouteInformation] で解析された [RoutePath] から状態を更新する
  ///
  /// [setNewRoutePath] の後に notifyListeners を呼び出すべき
  /// 非同期処理を行わない場合 [SynchronousFuture] で返却すべき
  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    logger.finest("setNewRoutePath: ${configuration.runtimeType}");
    if (configuration is AuthRoutePath) {
      _ref
          .read(authNavigationStateProvider.notifier)
          .updateAuthRoutePath(configuration);
    }
    if (configuration is MainRoutePath) {
      _ref
          .read(mainNavigationStateProvider.notifier)
          .updateMainRoutePathWithRoutePath(configuration);
    }
    _ref.read(navigateTriggerProvider.notifier).navigate();
    return SynchronousFuture<void>(null);
  }

  /// 状態の復元中に Router によって呼び出される、基本的に記載する必要はない
  // @override
  // Future<void> setRestoredRoutePath(RoutePath configuration) {
  //   return setNewRoutePath(configuration); // デフォルト
  // }

  /// アプリ起動時にのみ呼び出される状態更新処理、必要であれば記載する
  // @override
  // Future<void> setInitialRoutePath(RoutePath configuration) async {
  //   logger.finest("setInitialRoutePath");
  //   return super.setInitialRoutePath(configuration);
  // }
}
