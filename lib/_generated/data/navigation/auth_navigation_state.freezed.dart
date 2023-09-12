// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../data/navigation/auth_navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthNavigationState {
  bool get isOpenForgotPasswordPage => throw _privateConstructorUsedError;
  bool get isOpenResetPasswordPage => throw _privateConstructorUsedError;
  bool get isOpenSignUpPage => throw _privateConstructorUsedError;
  AuthRoutePath get authRoutePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthNavigationStateCopyWith<AuthNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthNavigationStateCopyWith<$Res> {
  factory $AuthNavigationStateCopyWith(
          AuthNavigationState value, $Res Function(AuthNavigationState) then) =
      _$AuthNavigationStateCopyWithImpl<$Res, AuthNavigationState>;
  @useResult
  $Res call(
      {bool isOpenForgotPasswordPage,
      bool isOpenResetPasswordPage,
      bool isOpenSignUpPage,
      AuthRoutePath authRoutePath});
}

/// @nodoc
class _$AuthNavigationStateCopyWithImpl<$Res, $Val extends AuthNavigationState>
    implements $AuthNavigationStateCopyWith<$Res> {
  _$AuthNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpenForgotPasswordPage = null,
    Object? isOpenResetPasswordPage = null,
    Object? isOpenSignUpPage = null,
    Object? authRoutePath = null,
  }) {
    return _then(_value.copyWith(
      isOpenForgotPasswordPage: null == isOpenForgotPasswordPage
          ? _value.isOpenForgotPasswordPage
          : isOpenForgotPasswordPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpenResetPasswordPage: null == isOpenResetPasswordPage
          ? _value.isOpenResetPasswordPage
          : isOpenResetPasswordPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpenSignUpPage: null == isOpenSignUpPage
          ? _value.isOpenSignUpPage
          : isOpenSignUpPage // ignore: cast_nullable_to_non_nullable
              as bool,
      authRoutePath: null == authRoutePath
          ? _value.authRoutePath
          : authRoutePath // ignore: cast_nullable_to_non_nullable
              as AuthRoutePath,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthNavigationStateCopyWith<$Res>
    implements $AuthNavigationStateCopyWith<$Res> {
  factory _$$_AuthNavigationStateCopyWith(_$_AuthNavigationState value,
          $Res Function(_$_AuthNavigationState) then) =
      __$$_AuthNavigationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isOpenForgotPasswordPage,
      bool isOpenResetPasswordPage,
      bool isOpenSignUpPage,
      AuthRoutePath authRoutePath});
}

/// @nodoc
class __$$_AuthNavigationStateCopyWithImpl<$Res>
    extends _$AuthNavigationStateCopyWithImpl<$Res, _$_AuthNavigationState>
    implements _$$_AuthNavigationStateCopyWith<$Res> {
  __$$_AuthNavigationStateCopyWithImpl(_$_AuthNavigationState _value,
      $Res Function(_$_AuthNavigationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpenForgotPasswordPage = null,
    Object? isOpenResetPasswordPage = null,
    Object? isOpenSignUpPage = null,
    Object? authRoutePath = null,
  }) {
    return _then(_$_AuthNavigationState(
      isOpenForgotPasswordPage: null == isOpenForgotPasswordPage
          ? _value.isOpenForgotPasswordPage
          : isOpenForgotPasswordPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpenResetPasswordPage: null == isOpenResetPasswordPage
          ? _value.isOpenResetPasswordPage
          : isOpenResetPasswordPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpenSignUpPage: null == isOpenSignUpPage
          ? _value.isOpenSignUpPage
          : isOpenSignUpPage // ignore: cast_nullable_to_non_nullable
              as bool,
      authRoutePath: null == authRoutePath
          ? _value.authRoutePath
          : authRoutePath // ignore: cast_nullable_to_non_nullable
              as AuthRoutePath,
    ));
  }
}

/// @nodoc

class _$_AuthNavigationState
    with DiagnosticableTreeMixin
    implements _AuthNavigationState {
  const _$_AuthNavigationState(
      {this.isOpenForgotPasswordPage = false,
      this.isOpenResetPasswordPage = false,
      this.isOpenSignUpPage = false,
      required this.authRoutePath});

  @override
  @JsonKey()
  final bool isOpenForgotPasswordPage;
  @override
  @JsonKey()
  final bool isOpenResetPasswordPage;
  @override
  @JsonKey()
  final bool isOpenSignUpPage;
  @override
  final AuthRoutePath authRoutePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthNavigationState(isOpenForgotPasswordPage: $isOpenForgotPasswordPage, isOpenResetPasswordPage: $isOpenResetPasswordPage, isOpenSignUpPage: $isOpenSignUpPage, authRoutePath: $authRoutePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthNavigationState'))
      ..add(DiagnosticsProperty(
          'isOpenForgotPasswordPage', isOpenForgotPasswordPage))
      ..add(DiagnosticsProperty(
          'isOpenResetPasswordPage', isOpenResetPasswordPage))
      ..add(DiagnosticsProperty('isOpenSignUpPage', isOpenSignUpPage))
      ..add(DiagnosticsProperty('authRoutePath', authRoutePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthNavigationState &&
            (identical(
                    other.isOpenForgotPasswordPage, isOpenForgotPasswordPage) ||
                other.isOpenForgotPasswordPage == isOpenForgotPasswordPage) &&
            (identical(
                    other.isOpenResetPasswordPage, isOpenResetPasswordPage) ||
                other.isOpenResetPasswordPage == isOpenResetPasswordPage) &&
            (identical(other.isOpenSignUpPage, isOpenSignUpPage) ||
                other.isOpenSignUpPage == isOpenSignUpPage) &&
            (identical(other.authRoutePath, authRoutePath) ||
                other.authRoutePath == authRoutePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpenForgotPasswordPage,
      isOpenResetPasswordPage, isOpenSignUpPage, authRoutePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthNavigationStateCopyWith<_$_AuthNavigationState> get copyWith =>
      __$$_AuthNavigationStateCopyWithImpl<_$_AuthNavigationState>(
          this, _$identity);
}

abstract class _AuthNavigationState implements AuthNavigationState {
  const factory _AuthNavigationState(
      {final bool isOpenForgotPasswordPage,
      final bool isOpenResetPasswordPage,
      final bool isOpenSignUpPage,
      required final AuthRoutePath authRoutePath}) = _$_AuthNavigationState;

  @override
  bool get isOpenForgotPasswordPage;
  @override
  bool get isOpenResetPasswordPage;
  @override
  bool get isOpenSignUpPage;
  @override
  AuthRoutePath get authRoutePath;
  @override
  @JsonKey(ignore: true)
  _$$_AuthNavigationStateCopyWith<_$_AuthNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
