// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/api/i_sample_data_list_fetcher.dart';
import 'package:flutter_application_1/model/api/i_sample_data_post.dart';
import 'package:flutter_application_1/model/api/i_sample_data_searcher.dart';
import 'package:flutter_application_1/model/api/mock/mock_i_sample_data_list_fetcher.dart';
import 'package:flutter_application_1/model/api/mock/mock_i_sample_data_post.dart';
import 'package:flutter_application_1/model/api/mock/mock_i_sample_data_searcher.dart';
import 'package:flutter_application_1/model/auth/i_fetch_session.dart';
import 'package:flutter_application_1/model/auth/i_forgot_password.dart';
import 'package:flutter_application_1/model/auth/i_reset_password.dart';
import 'package:flutter_application_1/model/auth/i_sign_in_with_email_and_password.dart';
import 'package:flutter_application_1/model/auth/i_sign_out.dart';
import 'package:flutter_application_1/model/auth/i_sign_up_with_email_and_password.dart';
import 'package:flutter_application_1/model/auth/mock/mock_i_fetch_session.dart';
import 'package:flutter_application_1/model/auth/mock/mock_i_forgot_password.dart';
import 'package:flutter_application_1/model/auth/mock/mock_i_reset_password.dart';
import 'package:flutter_application_1/model/auth/mock/mock_i_sign_in_with_email_and_password.dart';
import 'package:flutter_application_1/model/auth/mock/mock_i_sign_out.dart';
import 'package:flutter_application_1/model/auth/mock/mock_i_sign_up_with_email_and_password.dart';
import 'package:flutter_application_1/model/repository/sample_data_repository.dart';
import 'package:flutter_application_1/model/repository/sample_data_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/view/navigation/main_route_information_parser.dart';
import 'package:flutter_application_1/view/navigation/main_router_delegate.dart';
import 'package:logging/logging.dart';
import 'package:url_strategy/url_strategy.dart';

final logger = Logger("Logger");

void main() {
  Logger.root.level = kReleaseMode ? Level.WARNING : Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint(
        '[${rec.loggerName}] ${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  // URL の余計な # を削除する
  setPathUrlStrategy();
  runApp(DevicePreview(
    // DevicePreview を使用する
    // Web でデバッグする際に様々なデバイスにおける見た目を調整できる
    enabled: kIsWeb && !kReleaseMode,
    builder: (context) => ProviderScope(
      // overrides で依存性注入
      // Model 層の Interface の Provider に注入することで
      // View + provider のテストを行う
      overrides: [
        sampleDataSearcherProvider
            .overrideWith((ref) => MockISampleDataSearcher()),
        sampleDataPostProvider.overrideWith((ref) => MockISampleDataPost()),
        sampleDataListFetcherProvider
            .overrideWith((ref) => MockISampleDataListFetcher()),
        sampleDataRepositoryProvider
            .overrideWith((ref) => ref.read(sampleDataRepositoryImplProvider)),
        iSignUpWithEmailAndPasswordProvider
            .overrideWith((ref) => MockISignUpWithEmailAndPassword()),
        iSignInWithEmailAndPasswordProvider
            .overrideWith((ref) => MockISignInWithEmailAndPassword()),
        iFetchSessionProvider.overrideWith((ref) => MockIFetchSession()),
        iResetPasswordProvider.overrideWith((ref) => MockIResetPassword()),
        iSignOutProvider.overrideWith((ref) => MockISignOut()),
        iForgotPasswordProvider.overrideWith((ref) => MockIForgotPassword()),
      ],
      child: MyApp(),
    ),
  ));
}

/// アプリケーション本体
class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  // Android 用の戻るボタンを押したときの挙動を制御するもの
  final BackButtonDispatcher _backButtonDispatcher = RootBackButtonDispatcher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "Flutter Sample Application",
      // アプリケーション全体で適応するテーマを書く
      theme: ThemeData.light(useMaterial3: true).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
      // routerDelegate, routeInformationParser で Navigator2.0 を用いた画面遷移を行う
      routerDelegate: MainRouterDelegate(ref),
      routeInformationParser: MainRouteInformationParser(ref),
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}
