import 'package:flutter_application_1/provider/navigation/sample_tabbar_navigation.dart';

abstract class RoutePath {
  Uri uri;
  RoutePath(String path) : uri = Uri(path: path);
  String get location;
}

class NotFound404Path extends RoutePath {
  NotFound404Path() : super('/${NotFound404Path.path}');
  static const path = 'not-found-error';
  @override
  String get location => '/not-found-error';
}

// ---------------------- AuthRoute ----------------------
abstract class AuthRoutePath extends RoutePath {
  AuthRoutePath(String path) : super(path);
}

class LoginPath extends AuthRoutePath {
  LoginPath() : super('/${LoginPath.path}');
  static const path = 'login';
  @override
  String get location => '/${LoginPath.path}';
}

class SignUpPath extends AuthRoutePath {
  SignUpPath() : super('/${SignUpPath.path}');
  static const path = 'signup';
  @override
  String get location => '/${SignUpPath.path}';
}

class ForgotPasswordPath extends AuthRoutePath {
  ForgotPasswordPath() : super('/${ForgotPasswordPath.path}');
  static const path = 'forgot-password';
  @override
  String get location => '/${ForgotPasswordPath.path}';
}

class ResetPasswordPath extends AuthRoutePath {
  ResetPasswordPath() : super('/${ResetPasswordPath.path}');
  static const path = 'reset-password';
  @override
  String get location => '/${ResetPasswordPath.path}';
}

// ---------------------- MainAppRoute ----------------------
abstract class MainAppRoutePath extends RoutePath {
  MainAppRoutePath(String path) : super(path);
}

class HomePath extends MainAppRoutePath {
  HomePath() : super('/');
  static const path = '';
  @override
  String get location => '/';
}

class TabSamplePath extends MainAppRoutePath {
  TabSamplePath(this.sampleTabBar)
      : super('/${TabSamplePath.path}/${sampleTabBar.pathName}');
  static const path = 'tab-sample';
  final SampleTabBar sampleTabBar;
  @override
  String get location => '/${TabSamplePath.path}/${sampleTabBar.pathName}';
}

class SampleDataListPath extends MainAppRoutePath {
  SampleDataListPath() : super('/${SampleDataListPath.path}');
  static const path = 'data-list';
  @override
  String get location => '/${SampleDataListPath.path}';
}

class SampleDataDetailPath extends MainAppRoutePath {
  SampleDataDetailPath(this.id) : super('/${SampleDataListPath.path}/$id');
  final String id;
  @override
  String get location => '/${SampleDataListPath.path}/$id';
}

class SettingPath extends MainAppRoutePath {
  SettingPath() : super('/${SettingPath.path}');
  static const path = 'settings';
  @override
  String get location => '/${SettingPath.path}';
}

class UserSettingPath extends MainAppRoutePath {
  UserSettingPath() : super('/${SettingPath.path}/${UserSettingPath.path}');
  static const path = 'user';
  @override
  String get location => '/${SettingPath.path}/${UserSettingPath.path}';
}
