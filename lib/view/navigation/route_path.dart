import 'package:flutter_application_1/provider/navigation/sample_tabbar_navigation.dart';

/// ユーザー定義クラス
abstract class RoutePath {
  Uri uri;
  RoutePath(String path) : uri = Uri(path: path);
}

// ---------------------- AuthRoute ----------------------
/// 未認証時のパス
abstract class AuthRoutePath extends RoutePath {
  AuthRoutePath(String path) : super(path);
}

class LoginPath extends AuthRoutePath {
  LoginPath() : super('/${LoginPath.path}');
  static const path = 'login';
}

class SignUpPath extends AuthRoutePath {
  SignUpPath() : super('/${SignUpPath.path}');
  static const path = 'signup';
}

class ForgotPasswordPath extends AuthRoutePath {
  ForgotPasswordPath() : super('/${ForgotPasswordPath.path}');
  static const path = 'forgot-password';
}

class ResetPasswordPath extends AuthRoutePath {
  ResetPasswordPath() : super('/${ResetPasswordPath.path}');
  static const path = 'reset-password';
}

class FetchingSessionPath extends AuthRoutePath {
  FetchingSessionPath(String path) : super(path);
}

// ---------------------- MainAppRoute ----------------------
/// メインアプリのパス
abstract class MainAppRoutePath extends RoutePath {
  MainAppRoutePath(String path) : super(path);
}

class HomePath extends MainAppRoutePath {
  HomePath() : super('/');
  static const path = '';
}

class TabSamplePath extends MainAppRoutePath {
  TabSamplePath(this.sampleTabBar)
      : super('/${TabSamplePath.path}/${sampleTabBar.pathName}');
  static const path = 'tab-sample';
  final SampleTabBar sampleTabBar;
}

class SampleDataListPath extends MainAppRoutePath {
  SampleDataListPath() : super('/${SampleDataListPath.path}');
  static const path = 'data-list';
}

class SampleDataDetailPath extends MainAppRoutePath {
  SampleDataDetailPath(this.id) : super('/${SampleDataListPath.path}/$id');
  final String id;
}

class SettingPath extends MainAppRoutePath {
  SettingPath() : super('/${SettingPath.path}');
  static const path = 'settings';
}

class UserSettingPath extends MainAppRoutePath {
  UserSettingPath() : super('/${SettingPath.path}/${UserSettingPath.path}');
  static const path = 'user';
}
