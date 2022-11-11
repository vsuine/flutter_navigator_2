import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation.dart';
import 'package:flutter_application_1/provider/navigation/sample_tabbar_navigation.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:flutter_application_1/view/navigation/route_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 主に OS とのやり取りを定義する
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
    debugPrint('parseRouteInformation');
    debugPrint('\t routeInformation.location == ${routeInformation.location}');

    final uri = Uri.parse(routeInformation.location ?? '');
    bool hasSession = _ref.read(userDataProvider) != null;
    if (isFetchedSession == false) {
      hasSession =
          await _ref.read(authNavigationProvider.notifier).fetchSession();
      isFetchedSession = true;
      return _checkPath(uri, hasSession);
    } else {
      return SynchronousFuture(_checkPath(uri, hasSession));
    }
  }

  /// アプリの状態から Web の URL を更新するためのメソッド
  ///
  /// [RouterDelegate.currentConfiguration] の後に呼び出され、
  /// 渡された [RoutePath] が持つ状態から [RouteInformation] に変換する
  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    debugPrint('restoreRouteInformation');
    debugPrint('\t configuration.runtimeType: ${configuration.runtimeType}');
    return RouteInformation(location: configuration.uri.path);
  }

  /// [uri]         : [RouteInformation.location] から取得した [Uri]
  ///
  /// [hasSession]  : セッション維持
  RoutePath _checkPath(Uri uri, bool hasSession) {
    final firstPath = uri.pathSegments.isEmpty ? '' : uri.pathSegments.first;
    if (hasSession == false) {
      // セッションを維持していないなら AuthRoutePath への遷移
      switch (firstPath) {
        case LoginPath.path:
          return LoginPath();
        case SignUpPath.path:
          return SignUpPath();
        case ForgotPasswordPath.path:
          return ForgotPasswordPath();
        case ResetPasswordPath.path:
          return ResetPasswordPath();
        default:
          return LoginPath();
      }
    }
    // セッションを保持しているなら MainAppRoutePath に遷移する
    // ログインページなどへの遷移は許可しない
    switch (firstPath) {
      case HomePath.path:
        return HomePath();
      case TabSamplePath.path:
        SampleTabBar sampleTabBar = SampleTabBar.tab01;
        if (uri.pathSegments.length == 2) {
          sampleTabBar = SampleTabBar.values.firstWhere(
            (element) => element.pathName == uri.pathSegments[1],
            orElse: () => SampleTabBar.tab01,
          );
        }
        return TabSamplePath(sampleTabBar);
      case SampleDataListPath.path:
        if (uri.pathSegments.length == 2) {
          return SampleDataDetailPath(uri.pathSegments[1]);
        }
        return SampleDataListPath();
      case SettingPath.path:
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments[1] == UserSettingPath.path) {
          return UserSettingPath();
        }
        return SettingPath();
      default:
        return HomePath();
    }
  }
}
