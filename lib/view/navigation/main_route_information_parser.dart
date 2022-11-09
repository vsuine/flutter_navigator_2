import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation.dart';
import 'package:flutter_application_1/provider/navigation/sample_tabbar_navigation.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:flutter_application_1/view/navigation/route_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainRouteInformationParser extends RouteInformationParser<RoutePath> {
  MainRouteInformationParser(this._ref);
  final WidgetRef _ref;
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    /// Web ページの url に値を入力したとき（初回アクセスも含む）に呼び出される
    /// OS から通知される RouteInformation をアプリの状態である RoutePath に変換する
    /// Web: url から現在のパスを解析する
    /// async な理由は auth guard、つまり認証チェックなどを行うなどのため
    /// つまり、リダイレクトなどはここで行う

    debugPrint('parseRouteInformation');
    debugPrint('\trouteInformation.location == ${routeInformation.location}');

    if (_ref.read(userDataProvider) == null) {
      await _ref.watch(authNavigationProvider.notifier).fetchSession();
    }

    final pathSegment = Uri.parse(routeInformation.location ?? '').pathSegments;
    final firstPath = pathSegment.isEmpty ? '' : pathSegment.first;

    switch (firstPath) {
      case LoginPath.path:
        return LoginPath();
      case SignUpPath.path:
        return SignUpPath();
      case ForgotPasswordPath.path:
        return ForgotPasswordPath();
      case ResetPasswordPath.path:
        return ResetPasswordPath();
    }
    if (_ref.read(userDataProvider) == null) return LoginPath();
    switch (firstPath) {
      case HomePath.path:
        return HomePath();
      case TabSamplePath.path:
        SampleTabBar sampleTabBar = SampleTabBar.tab01;
        if (pathSegment.length == 2) {
          sampleTabBar = SampleTabBar.values.firstWhere(
            (element) => element.pathName == pathSegment[1],
            orElse: () => SampleTabBar.tab01,
          );
        }
        return TabSamplePath(sampleTabBar);
      case SampleDataListPath.path:
        if (pathSegment.length == 2) {
          return SampleDataDetailPath(pathSegment[1]);
        }
        return SampleDataListPath();
      case SettingPath.path:
        if (pathSegment.length == 2 && pathSegment[1] == UserSettingPath.path) {
          return UserSettingPath();
        }
        return SettingPath();
      default:
        return LoginPath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    /// currentConfiguration の後に呼び出される
    /// currentConfiguration で得た RoutePath が持つ状態から RouteInformation に変換する
    /// location (url) が異なれば OS に通知する
    /// つまり、アプリの状態から Web の URL を更新するためのもの

    debugPrint('restoreRouteInformation');
    debugPrint('\tconfiguration.runtimeType: ${configuration.runtimeType}');
    return RouteInformation(location: configuration.location);
  }
}
