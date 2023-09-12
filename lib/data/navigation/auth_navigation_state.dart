import 'package:flutter_application_1/data/navigation/route_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part '../../_generated/data/navigation/auth_navigation_state.freezed.dart';

@freezed
class AuthNavigationState with _$AuthNavigationState {
  const factory AuthNavigationState({
    @Default(false) bool isOpenForgotPasswordPage,
    @Default(false) bool isOpenResetPasswordPage,
    @Default(false) bool isOpenSignUpPage,
    required AuthRoutePath authRoutePath,
  }) = _AuthNavigationState;
}
