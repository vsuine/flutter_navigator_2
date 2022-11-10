import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation.dart';
import 'package:flutter_application_1/provider/navigation/navigate_triger_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot password')),
      body: Center(
          child: TextButton(
              onPressed: () {
                ref
                    .read(authNavigationProvider.notifier)
                    .setOpenResetPasswordPage(true);
                ref.read(navigateTrigerProvider.notifier).navigate();
              },
              child: const Text('ForgotPass'))),
    );
  }
}
