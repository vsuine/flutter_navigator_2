import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/input_validator/email_validator.dart';
import 'package:flutter_application_1/model/input_validator/password_validator.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordView extends HookWidget {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final emailTextEditingController =
        useTextEditingController(text: "sample@example.com");
    final newPasswordTextEditingController =
        useTextEditingController(text: "P@ssw0rd");
    final confirmNewPasswordTextEditingController =
        useTextEditingController(text: "P@ssw0rd");
    final formKey = useMemoized(() => GlobalKey<FormState>(), const []);
    final isWaiting = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
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
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextFormField(
                        controller: newPasswordTextEditingController,
                        validator: (value) {
                          if (PasswordValidator.isValidPassword(value) ==
                              false) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "New Password",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextFormField(
                        controller: confirmNewPasswordTextEditingController,
                        validator: (value) {
                          if (PasswordValidator.isValidPassword(value) ==
                                  false ||
                              newPasswordTextEditingController.text !=
                                  confirmNewPasswordTextEditingController
                                      .text) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Confirm New Password",
                        ),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => TextButton(
                        onPressed: () async {
                          if (formKey.currentState == null ||
                              formKey.currentState!.validate() == false) {
                            return;
                          }
                          isWaiting.value = true;
                          await ref
                              .read(authNavigationStateProvider.notifier)
                              .resetPassword(
                                "email",
                                "newPassword",
                                "confirmNewPassword",
                              );
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
                            : const Text("ResetPassword"),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
