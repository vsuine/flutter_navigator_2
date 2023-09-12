import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/input_validator/email_validator.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordView extends HookConsumerWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextEditingController =
        useTextEditingController(text: "sample@example.com");
    final formKey = useMemoized(() => GlobalKey<FormState>(), const []);
    final isWaiting = useState(false);
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot password")),
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: emailTextEditingController,
                    validator: (value) {
                      if (EmailValidator.isValidEmail(value) == false) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email",
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      if (isWaiting.value) return;
                      if (formKey.currentState == null ||
                          formKey.currentState!.validate() == false) {
                        return;
                      }
                      isWaiting.value = true;
                      await ref
                          .read(authNavigationStateProvider.notifier)
                          .forgotPassword(emailTextEditingController.text);
                      ref.read(navigateTriggerProvider.notifier).navigate();
                      isWaiting.value = false;
                    },
                    child: isWaiting.value
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ))
                        : const Text("Send reset code"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
