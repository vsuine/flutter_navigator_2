import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpView extends HookWidget {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final emailTextEditingController =
        useTextEditingController(text: "sample@example.com");
    final passwordTextEditingController =
        useTextEditingController(text: "P@ssw0rd");
    final confirmPasswordTextEditingController =
        useTextEditingController(text: "P@ssw0rd");
    final formKey = useMemoized(() => GlobalKey<FormState>(), const []);
    final isWaiting = useState(false);
    return Scaffold(
      appBar: AppBar(title: const Text("SignUp")),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: emailTextEditingController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: passwordTextEditingController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "New Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: confirmPasswordTextEditingController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Confirm New Password",
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => TextButton(
                    child: isWaiting.value
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ))
                        : const Text("SignUp"),
                    onPressed: () async {
                      if (isWaiting.value) return;
                      if (formKey.currentState == null ||
                          formKey.currentState!.validate() == false) {
                        return;
                      }
                      isWaiting.value = true;
                      await ref
                          .read(authNavigationStateProvider.notifier)
                          .signUpWithEmailAndPassword(
                              emailTextEditingController.text,
                              passwordTextEditingController.text,
                              confirmPasswordTextEditingController.text);
                      ref.read(navigateTriggerProvider.notifier).navigate();
                      isWaiting.value = false;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
