import 'package:flutter/material.dart';

class FetchLoadingPage extends Page {
  /// 背景を半透過したローディングページ
  ///
  /// セッションチェック中にローディング画面を前面に出し、
  /// ユーザーからの操作を受け付けないようにする
  const FetchLoadingPage() : super(key: const ValueKey('FetchLoadingPage'));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        transitionDuration: const Duration(seconds: 0),
        opaque: false,
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Scaffold(
              backgroundColor: Colors.black.withOpacity(0.5),
              body: const Center(child: CircularProgressIndicator()));
        });
  }
}
