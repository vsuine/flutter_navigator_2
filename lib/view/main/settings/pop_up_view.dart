import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/main_navigation_state_notifier.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 背景を半透過したダイアログのようなページ例
class SettingPopUpViewPage extends Page {
  const SettingPopUpViewPage({LocalKey? key}) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 0),
      opaque: false,
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: AlertDialog(
            actions: [
              Consumer(
                builder: (context, ref, child) => TextButton(
                    onPressed: () {
                      ref
                          .read(mainNavigationStateProvider.notifier)
                          .updateMainRoutePath(isOpenSettingsPopup: false);
                      ref.read(navigateTriggerProvider.notifier).navigate();
                    },
                    child: const Text("Close")),
              )
            ],
            content: const Text("PopUp Settings Detail View"),
          ),
        );
      },
    );
  }
}
