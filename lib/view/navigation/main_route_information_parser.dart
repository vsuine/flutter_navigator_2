import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:flutter_application_1/data/navigation/route_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [RouteInformationParser] は OS とのやり取りを行う
class MainRouteInformationParser extends RouteInformationParser<RoutePath> {
  MainRouteInformationParser(this._ref);
  final WidgetRef _ref;
  // 初回だけセッション維持を確認する
  bool isFetchedSession = false;

  /// [RouteInformationProvider] から通知される [RouteInformation] を
  /// アプリの状態である [RoutePath] に変換する
  ///
  /// Web : URL に値を入力したとき、「戻る」「進む」が押されたときに呼び出される
  ///
  /// その他プラットフォーム : 初回アクセス時に呼び出される
  ///
  /// Async な理由は認証チェックなどを行うため
  /// async 処理をしないなら [SynchronousFuture] 返却を検討する
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    logger.finest(
        "parseRouteInformation: routeInformation.location == ${routeInformation.uri.path}");

    final uri = routeInformation.uri;
    bool hasSession =
        _ref.read(userDataProvider).asData?.value?.sessionInfo != null;
    if (isFetchedSession == false) {
      isFetchedSession = true;
      await _ref.read(authNavigationStateProvider.notifier).fetchSession();
      hasSession =
          _ref.read(userDataProvider).asData?.value?.sessionInfo != null;
      return _checkPath(uri, hasSession);
    } else {
      return SynchronousFuture(_checkPath(uri, hasSession));
    }
  }

  /// アプリの状態からパスを更新するためのメソッド
  ///
  /// [RouterDelegate.currentConfiguration] の後に呼び出され、
  /// 渡された [RoutePath] が持つ状態から [RouteInformation] に変換する
  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    logger.finest("restoreRouteInformation: ${configuration.runtimeType}");
    return RouteInformation(uri: configuration.uri);
  }

  /// [RouteInformation.uri] とセッション情報を維持しているか [hasSession] を用いて
  /// [RoutePath] に変換する
  RoutePath _checkPath(Uri uri, bool hasSession) {
    // セッションを維持していないなら AuthRoutePath への遷移
    if (hasSession == false) {
      return AuthRoutePath.fromUri(uri);
    }
    // セッションを保持しているなら MainAppRoutePath に遷移する
    // ログインページなどへの遷移は拒否し、必要であればログアウトさせる
    return MainRoutePath.fromUri(uri);
  }
}
