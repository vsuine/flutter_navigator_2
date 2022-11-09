import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/auth_navigation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isLogginIn = useState<bool>(false);
    final formKey = useMemoized(() => GlobalKey<FormState>(), const []);
    // NOTE: リリースするなら初期値を消す
    final emailTextController =
        useTextEditingController(text: 'sample@example.com');
    final passwordTextController = useTextEditingController(text: 'P@ssw0rd');
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
          child: Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: TextFormField(
                                  controller: emailTextController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email must not be empty';
                                    }
                                    final regex = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                    if (regex.hasMatch(value)) {
                                      return null;
                                    }
                                    return 'Invalid Email';
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined),
                                      hintText: 'Email'),
                                )),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: TextFormField(
                                  controller: passwordTextController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password must not be empty';
                                    }
                                    final regex = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    if (regex.hasMatch(value)) {
                                      return null;
                                    }
                                    return 'Invalid Password';
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.lock_outline),
                                      hintText: 'Password'),
                                )),
                          ],
                        )),
                    Consumer(
                      builder: (context, ref, child) => TextButton(
                        onPressed: () async {
                          if (isLogginIn.value) return;
                          if (formKey.currentState == null ||
                              formKey.currentState!.validate() == false) {
                            return;
                          }
                          isLogginIn.value = true;
                          await ref
                              .read(authNavigationProvider.notifier)
                              .loginWithEmailAndPassword(
                                  emailTextController.text,
                                  passwordTextController.text);
                          isLogginIn.value = false;
                        },
                        child: isLogginIn.value
                            ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Theme.of(context).indicatorColor,
                                ))
                            : const Text('Login'),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => TextButton(
                          onPressed: () {
                            ref
                                .read(authNavigationProvider.notifier)
                                .setOpenSignUpPage(true);
                          },
                          child: const Text('SignUp')),
                    ),
                    Consumer(
                      builder: (context, ref, child) => TextButton(
                          onPressed: () {
                            ref
                                .read(authNavigationProvider.notifier)
                                .setOpenForgotPasswordPage(true);
                          },
                          child: const Text('If forgot password')),
                    ),
                  ]))),
    );
  }
}
