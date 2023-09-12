import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/session_timeout_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SessionTimeoutPage extends Page {
  /// 背景を半透過したセッションタイムアウトページ
  const SessionTimeoutPage() : super(key: const ValueKey("SessionTimeoutView"));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 0),
      opaque: false,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: Center(
            child: AlertDialog(
              title: const Text("セッションタイムアウト"),
              actions: [
                Consumer(
                  builder: (context, ref, child) => TextButton(
                    onPressed: () async {
                      await ref
                          .read(authNavigationStateProvider.notifier)
                          .signOut();
                      ref
                          .read(isSessionTimeoutProvider.notifier)
                          .update((state) => false);
                    },
                    child: const Text("ログアウト"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
