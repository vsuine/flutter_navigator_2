import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/navigation/main_navigation_state_notifier.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingView extends HookWidget {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isLoggingOut = useState(false);
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) => TextButton(
                child: const Text("Setting Detail View"),
                onPressed: () async {
                  ref
                      .read(mainNavigationStateProvider.notifier)
                      .updateMainRoutePath(isOpenSettingsPopup: true);
                  ref.read(navigateTriggerProvider.notifier).navigate();
                },
              ),
            ),
            const SizedBox(height: 32),
            Consumer(
              builder: (context, ref, child) => TextButton(
                onPressed: () async {
                  if (isLoggingOut.value) return;
                  isLoggingOut.value = true;
                  await ref
                      .read(authNavigationStateProvider.notifier)
                      .signOut();
                  ref.read(navigateTriggerProvider.notifier).navigate();
                  isLoggingOut.value = false;
                },
                child: isLoggingOut.value
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 3))
                    : const Text(
                        "SignOut",
                        style: TextStyle(color: Colors.red),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
