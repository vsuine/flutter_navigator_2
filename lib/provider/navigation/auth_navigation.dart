import 'package:flutter_application_1/model/auth/auth_model.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNavigationProvider =
    StateNotifierProvider<AuthNavigationStateNotifier, AuthNavigationState>(
        (ref) => AuthNavigationStateNotifier(ref));

class AuthNavigationStateNotifier extends StateNotifier<AuthNavigationState> {
  AuthNavigationStateNotifier(this._ref)
      : super(AuthNavigationState(
            isFetchingSession: true,
            isLoggedIn: false,
            isOpenForgotPasswordPage: false,
            isOpenResetPasswordPage: false,
            isOpenSignUpPage: false));

  final StateNotifierProviderRef _ref;

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final userData = await _ref
          .read(authServiceProvider)
          .loginWithEmailAndPassword(email, password);
      _ref.read(userDataProvider.notifier).update((state) => userData);
      state = state.copyWith(isLoggedIn: true);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    try {
      await _ref.read(authServiceProvider).logout();
      _ref.read(userDataProvider.notifier).update((state) => null);
      state = state.copyWith(isLoggedIn: false);
    } catch (e) {
      return;
    }
  }

  Future<bool> fetchSession() async {
    final userData = await _ref.read(authServiceProvider).fetchSession();
    _ref.read(userDataProvider.notifier).update((state) => userData);
    if (userData != null) {
      state = state.copyWith(isFetchingSession: false, isLoggedIn: true);
    } else {
      state = state.copyWith(isFetchingSession: false, isLoggedIn: false);
    }
    return userData != null;
  }

  void setOpenSignUpPage(bool isOpen) {
    state = state.copyWith(isOpenSignUpPage: isOpen);
  }

  void setOpenForgotPasswordPage(bool isOpen) {
    state = state.copyWith(isOpenForgotPasswordPage: isOpen);
  }

  void setOpenResetPasswordPage(bool isOpen) {
    state = state.copyWith(isOpenResetPasswordPage: isOpen);
  }
}

class AuthNavigationState {
  AuthNavigationState(
      {required this.isFetchingSession,
      required this.isLoggedIn,
      required this.isOpenSignUpPage,
      required this.isOpenForgotPasswordPage,
      required this.isOpenResetPasswordPage});

  bool isFetchingSession;
  bool isLoggedIn;
  bool isOpenSignUpPage;
  bool isOpenForgotPasswordPage;
  bool isOpenResetPasswordPage;

  AuthNavigationState copyWith(
      {bool? isFetchingSession,
      bool? isLoggedIn,
      bool? isOpenSignUpPage,
      bool? isOpenForgotPasswordPage,
      bool? isOpenResetPasswordPage}) {
    return AuthNavigationState(
        isFetchingSession: isFetchingSession ?? this.isFetchingSession,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        isOpenForgotPasswordPage:
            isOpenForgotPasswordPage ?? this.isOpenForgotPasswordPage,
        isOpenResetPasswordPage:
            isOpenResetPasswordPage ?? this.isOpenResetPasswordPage,
        isOpenSignUpPage: isOpenSignUpPage ?? this.isOpenSignUpPage);
  }
}
