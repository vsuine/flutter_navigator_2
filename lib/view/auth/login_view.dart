import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/navigation/route_path.dart';
import 'package:flutter_application_1/model/input_validator/email_validator.dart';
import 'package:flutter_application_1/model/input_validator/password_validator.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation_state_provider.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isLoggingIn = useState<bool>(false);
    final formKey = useMemoized(() => GlobalKey<FormState>(), const []);
    final emailTextController =
        useTextEditingController(text: "sample@example.com");
    final passwordTextController = useTextEditingController(text: "P@ssw0rd");
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Form(
          key: formKey,
          child: Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: TextFormField(
                          controller: emailTextController,
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
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: TextFormField(
                          controller: passwordTextController,
                          validator: (value) {
                            if (PasswordValidator.isValidPassword(value) ==
                                false) {
                              return "Invalid Password";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "Password",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer(
                    builder: (context, ref, child) => TextButton(
                      onPressed: () async {
                        if (isLoggingIn.value) return;
                        if (formKey.currentState == null ||
                            formKey.currentState!.validate() == false) {
                          return;
                        }
                        isLoggingIn.value = true;
                        await ref
                            .read(authNavigationStateProvider.notifier)
                            .signInWithEmailAndPassword(
                                emailTextController.text,
                                passwordTextController.text);
                        ref.read(navigateTriggerProvider.notifier).navigate();
                        isLoggingIn.value = false;
                      },
                      child: isLoggingIn.value
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                              ))
                          : const Text("Login"),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) => TextButton(
                        onPressed: () {
                          ref
                              .read(authNavigationStateProvider.notifier)
                              .updateAuthRoutePath(AuthRoutePath.signUp());
                          ref.read(navigateTriggerProvider.notifier).navigate();
                        },
                        child: const Text("SignUp")),
                  ),
                  Consumer(
                    builder: (context, ref, child) => TextButton(
                        onPressed: () {
                          ref
                              .read(authNavigationStateProvider.notifier)
                              .updateAuthRoutePath(
                                  AuthRoutePath.forgotPassword());
                          ref.read(navigateTriggerProvider.notifier).navigate();
                        },
                        child: const Text('If forgot password')),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
