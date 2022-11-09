import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation.dart';
import 'package:flutter_application_1/provider/navigation/setting_navigation.dart';
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer(
          builder: (context, ref, child) => TextButton(
              onPressed: () async {
                if (isLoggingOut.value) return;
                isLoggingOut.value = true;
                await ref.read(authNavigationProvider.notifier).logout();
                isLoggingOut.value = false;
              },
              child: isLoggingOut.value
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Theme.of(context).indicatorColor),
                    )
                  : const Text('Logout', style: TextStyle(color: Colors.red))),
        ),
        Consumer(
            builder: (context, ref, child) => TextButton(
                  child: const Text('Setting View'),
                  onPressed: () async {
                    ref
                        .read(isOpenSettingDetailProvider.notifier)
                        .update((state) => true);
                  },
                ))
      ])),
    );
  }
}

class SettingPopUpView extends StatelessWidget {
  const SettingPopUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pop up view')),
      body: const Center(child: Text('This is PopUp View')),
    );
  }
}
