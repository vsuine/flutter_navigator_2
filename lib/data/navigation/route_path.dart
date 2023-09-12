import 'package:flutter_application_1/data/navigation/sample_tab_bar_state.dart';

/// ユーザー定義クラス
abstract class RoutePath {
  Uri uri;
  RoutePath(String path) : uri = Uri(path: baseURL + path);
  static const String baseURL = "";
}

// ---------------------- AuthRoute ----------------------
/// 未認証時のパス
class AuthRoutePath extends RoutePath {
  AuthRoutePath(String path) : super(path);
  factory AuthRoutePath.login() {
    return LoginPath();
  }
  factory AuthRoutePath.signUp() {
    return SignUpPath();
  }
  factory AuthRoutePath.forgotPassword() {
    return ForgotPasswordPath();
  }
  factory AuthRoutePath.resetPassword() {
    return ResetPasswordPath();
  }
  factory AuthRoutePath.fromUri(Uri uri) {
    if (uri.pathSegments.isEmpty) return LoginPath();
    switch (uri.pathSegments.first) {
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
}

class LoginPath extends AuthRoutePath {
  LoginPath() : super("/${LoginPath.path}");
  static const path = "login";
}

class SignUpPath extends AuthRoutePath {
  SignUpPath() : super("/${SignUpPath.path}");
  static const path = "sign-up";
}

class ForgotPasswordPath extends AuthRoutePath {
  ForgotPasswordPath({this.email}) : super("/${ForgotPasswordPath.path}");
  static const path = "forgot-password";
  String? email;
}

class ResetPasswordPath extends AuthRoutePath {
  ResetPasswordPath({String? email}) : super("/${ResetPasswordPath.path}");
  static const path = "reset-password";
}

// ---------------------- MainRoute ----------------------
abstract class MainRoutePath extends RoutePath {
  MainRoutePath(String path, this.name) : super(path);
  String name;
  factory MainRoutePath.home() = HomePath;
  factory MainRoutePath.tabSamplePath(SampleTabBarState sampleTabBar) {
    return TabSamplePath(sampleTabBar);
  }
  factory MainRoutePath.sampleDataListPath() = SampleDataListPath;
  factory MainRoutePath.sampleDataDetailPath(String id) {
    return SampleDataDetailPath(id);
  }
  factory MainRoutePath.settingPath() = SettingPath;
  factory MainRoutePath.popUpSettingPath() = PopUpSettingPath;
  factory MainRoutePath.fromUri(Uri uri) {
    if (uri.pathSegments.isEmpty) return HomePath();
    final firstPath = uri.pathSegments.isEmpty ? "" : uri.pathSegments.first;
    switch (firstPath) {
      case HomePath.path:
        return HomePath();
      case TabSamplePath.path:
        SampleTabBarState sampleTabBar = SampleTabBarState.tab01;
        if (uri.pathSegments.length == 2) {
          sampleTabBar = SampleTabBarState.fromPath(
            pathName: uri.pathSegments[1],
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
            uri.pathSegments[1] == PopUpSettingPath.path) {
          return PopUpSettingPath();
        }
        return SettingPath();
      default:
        return HomePath();
    }
  }
}

class HomePath extends MainRoutePath {
  HomePath() : super("/", "Home");
  static const path = "";
}

class TabSamplePath extends MainRoutePath {
  TabSamplePath(this.sampleTabBar)
      : super("/${TabSamplePath.path}/${sampleTabBar.pathName}", "TabSample");
  static const path = "tab-sample";
  final SampleTabBarState sampleTabBar;
}

class SampleDataListPath extends MainRoutePath {
  SampleDataListPath() : super("/${SampleDataListPath.path}", "SampleDataList");
  static const path = "sample-data-list";
}

class SampleDataDetailPath extends MainRoutePath {
  SampleDataDetailPath(this.id)
      : super("/${SampleDataListPath.path}/$id", "SampleDataDetail");
  final String id;
}

class SettingPath extends MainRoutePath {
  SettingPath() : super("/${SettingPath.path}", "Settings");
  static const path = "settings";
}

class PopUpSettingPath extends MainRoutePath {
  PopUpSettingPath()
      : super("/${SettingPath.path}/${PopUpSettingPath.path}", "PopUpSetting");
  static const path = "pop-up-setting";
}
