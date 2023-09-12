import 'package:flutter_application_1/data/auth/user_data.dart';
import 'package:flutter_application_1/data/navigation/auth_navigation_state.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/auth/i_fetch_session.dart';
import 'package:flutter_application_1/model/auth/i_forgot_password.dart';
import 'package:flutter_application_1/model/auth/i_sign_out.dart';
import 'package:flutter_application_1/model/auth/i_reset_password.dart';
import 'package:flutter_application_1/model/auth/i_sign_in_with_email_and_password.dart';
import 'package:flutter_application_1/model/auth/i_sign_up_with_email_and_password.dart';
import 'package:flutter_application_1/provider/user_data_provider.dart';
import 'package:flutter_application_1/data/navigation/route_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNavigationStateNotifier extends StateNotifier<AuthNavigationState> {
  AuthNavigationStateNotifier(
    this._ref,
    this._iSignUpWithEmailAndPassword,
    this._iSignInWithEmailAndPassword,
    this._iFetchSession,
    this._iResetPassword,
    this._iSignOut,
    this._iForgotPassword,
  ) : super(AuthNavigationState(authRoutePath: AuthRoutePath.login()));

  final StateNotifierProviderRef _ref;
  final ISignInWithEmailAndPassword _iSignInWithEmailAndPassword;
  final IFetchSession _iFetchSession;
  final IResetPassword _iResetPassword;
  final ISignOut _iSignOut;
  final ISignUpWithEmailAndPassword _iSignUpWithEmailAndPassword;
  final IForgotPassword _iForgotPassword;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final res = await _iSignInWithEmailAndPassword.signInWithEmailAndPassword(
        email, password);
    res.when(success: (data) {
      _ref.read(userDataProvider.notifier).update(data);
    }, failure: (e) {
      logger.info("signIn失敗");
    });
  }

  Future<void> fetchSession() async {
    final res = await _iFetchSession.fetchSession();
    res.when(success: (data) {
      _ref.read(userDataProvider.notifier).update(data);
    }, failure: (e) {
      logger.info("fetchSession失敗");
    });
  }

  Future<void> resetPassword(
    String email,
    String newPassword,
    String confirmNewPassword,
  ) async {
    final res = await _iResetPassword.resetPassword(
      email,
      newPassword,
      confirmNewPassword,
    );
    res.when(success: (data) {
      updateAuthRoutePath(AuthRoutePath.login());
      logger.info("resetPassword成功");
    }, failure: (e) {
      logger.info("resetPassword失敗");
    });
  }

  Future<void> signOut({UserData? userData}) async {
    final res = await _iSignOut.signOut(userData: userData);
    res.when(success: (data) {
      _ref.read(userDataProvider.notifier).update(null);
    }, failure: (e) {
      logger.info("signOut失敗");
    });
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    final res = await _iSignUpWithEmailAndPassword.signUpWithEmailAndPassword(
      email,
      password,
      confirmPassword,
    );
    res.when(success: (data) {
      updateAuthRoutePath(AuthRoutePath.login());
      logger.info("signUpWithEmailAndPassword成功");
    }, failure: (e) {
      logger.info("signUpWithEmailAndPassword失敗");
    });
  }

  void updateAuthRoutePath(AuthRoutePath authRoutePath) {
    bool isOpenForgotPasswordPage = false;
    bool isOpenResetPasswordPage = false;
    bool isOpenSignUpPage = false;
    if (authRoutePath is LoginPath) {
    } else if (authRoutePath is ForgotPasswordPath) {
      isOpenForgotPasswordPage = true;
    } else if (authRoutePath is ResetPasswordPath) {
      isOpenForgotPasswordPage = true;
      isOpenResetPasswordPage = true;
    } else if (authRoutePath is SignUpPath) {
      isOpenSignUpPage = true;
    }
    state = state.copyWith(
      authRoutePath: authRoutePath,
      isOpenForgotPasswordPage: isOpenForgotPasswordPage,
      isOpenResetPasswordPage: isOpenResetPasswordPage,
      isOpenSignUpPage: isOpenSignUpPage,
    );
  }

  Future<void> forgotPassword(String email) async {
    final res = await _iForgotPassword.forgotPassword(email);
    res.when(success: (data) {
      updateAuthRoutePath(AuthRoutePath.resetPassword());
      logger.info("forgotPassword成功");
    }, failure: (e) {
      logger.info("forgotPassword失敗");
    });
  }
}

final authNavigationStateProvider =
    StateNotifierProvider<AuthNavigationStateNotifier, AuthNavigationState>(
  (ref) {
    return AuthNavigationStateNotifier(
      ref,
      ref.read(iSignUpWithEmailAndPasswordProvider),
      ref.read(iSignInWithEmailAndPasswordProvider),
      ref.read(iFetchSessionProvider),
      ref.read(iResetPasswordProvider),
      ref.read(iSignOutProvider),
      ref.read(iForgotPasswordProvider),
    );
  },
);
