// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../data/navigation/main_navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainNavigationState {
  SampleTabBarState get sampleTabBar => throw _privateConstructorUsedError;
  BottomNavigationState get bottomNavigationState =>
      throw _privateConstructorUsedError;
  bool get isOpenSettingsPopup => throw _privateConstructorUsedError;
  String? get selectedSampleDataId => throw _privateConstructorUsedError;
  MainRoutePath get mainRoutePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainNavigationStateCopyWith<MainNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainNavigationStateCopyWith<$Res> {
  factory $MainNavigationStateCopyWith(
          MainNavigationState value, $Res Function(MainNavigationState) then) =
      _$MainNavigationStateCopyWithImpl<$Res, MainNavigationState>;
  @useResult
  $Res call(
      {SampleTabBarState sampleTabBar,
      BottomNavigationState bottomNavigationState,
      bool isOpenSettingsPopup,
      String? selectedSampleDataId,
      MainRoutePath mainRoutePath});
}

/// @nodoc
class _$MainNavigationStateCopyWithImpl<$Res, $Val extends MainNavigationState>
    implements $MainNavigationStateCopyWith<$Res> {
  _$MainNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleTabBar = null,
    Object? bottomNavigationState = null,
    Object? isOpenSettingsPopup = null,
    Object? selectedSampleDataId = freezed,
    Object? mainRoutePath = null,
  }) {
    return _then(_value.copyWith(
      sampleTabBar: null == sampleTabBar
          ? _value.sampleTabBar
          : sampleTabBar // ignore: cast_nullable_to_non_nullable
              as SampleTabBarState,
      bottomNavigationState: null == bottomNavigationState
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState,
      isOpenSettingsPopup: null == isOpenSettingsPopup
          ? _value.isOpenSettingsPopup
          : isOpenSettingsPopup // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSampleDataId: freezed == selectedSampleDataId
          ? _value.selectedSampleDataId
          : selectedSampleDataId // ignore: cast_nullable_to_non_nullable
              as String?,
      mainRoutePath: null == mainRoutePath
          ? _value.mainRoutePath
          : mainRoutePath // ignore: cast_nullable_to_non_nullable
              as MainRoutePath,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainNavigationStateCopyWith<$Res>
    implements $MainNavigationStateCopyWith<$Res> {
  factory _$$_MainNavigationStateCopyWith(_$_MainNavigationState value,
          $Res Function(_$_MainNavigationState) then) =
      __$$_MainNavigationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SampleTabBarState sampleTabBar,
      BottomNavigationState bottomNavigationState,
      bool isOpenSettingsPopup,
      String? selectedSampleDataId,
      MainRoutePath mainRoutePath});
}

/// @nodoc
class __$$_MainNavigationStateCopyWithImpl<$Res>
    extends _$MainNavigationStateCopyWithImpl<$Res, _$_MainNavigationState>
    implements _$$_MainNavigationStateCopyWith<$Res> {
  __$$_MainNavigationStateCopyWithImpl(_$_MainNavigationState _value,
      $Res Function(_$_MainNavigationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sampleTabBar = null,
    Object? bottomNavigationState = null,
    Object? isOpenSettingsPopup = null,
    Object? selectedSampleDataId = freezed,
    Object? mainRoutePath = null,
  }) {
    return _then(_$_MainNavigationState(
      sampleTabBar: null == sampleTabBar
          ? _value.sampleTabBar
          : sampleTabBar // ignore: cast_nullable_to_non_nullable
              as SampleTabBarState,
      bottomNavigationState: null == bottomNavigationState
          ? _value.bottomNavigationState
          : bottomNavigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationState,
      isOpenSettingsPopup: null == isOpenSettingsPopup
          ? _value.isOpenSettingsPopup
          : isOpenSettingsPopup // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSampleDataId: freezed == selectedSampleDataId
          ? _value.selectedSampleDataId
          : selectedSampleDataId // ignore: cast_nullable_to_non_nullable
              as String?,
      mainRoutePath: null == mainRoutePath
          ? _value.mainRoutePath
          : mainRoutePath // ignore: cast_nullable_to_non_nullable
              as MainRoutePath,
    ));
  }
}

/// @nodoc

class _$_MainNavigationState
    with DiagnosticableTreeMixin
    implements _MainNavigationState {
  const _$_MainNavigationState(
      {this.sampleTabBar = SampleTabBarState.tab01,
      this.bottomNavigationState = BottomNavigationState.home,
      this.isOpenSettingsPopup = false,
      this.selectedSampleDataId = null,
      required this.mainRoutePath});

  @override
  @JsonKey()
  final SampleTabBarState sampleTabBar;
  @override
  @JsonKey()
  final BottomNavigationState bottomNavigationState;
  @override
  @JsonKey()
  final bool isOpenSettingsPopup;
  @override
  @JsonKey()
  final String? selectedSampleDataId;
  @override
  final MainRoutePath mainRoutePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainNavigationState(sampleTabBar: $sampleTabBar, bottomNavigationState: $bottomNavigationState, isOpenSettingsPopup: $isOpenSettingsPopup, selectedSampleDataId: $selectedSampleDataId, mainRoutePath: $mainRoutePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainNavigationState'))
      ..add(DiagnosticsProperty('sampleTabBar', sampleTabBar))
      ..add(DiagnosticsProperty('bottomNavigationState', bottomNavigationState))
      ..add(DiagnosticsProperty('isOpenSettingsPopup', isOpenSettingsPopup))
      ..add(DiagnosticsProperty('selectedSampleDataId', selectedSampleDataId))
      ..add(DiagnosticsProperty('mainRoutePath', mainRoutePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainNavigationState &&
            (identical(other.sampleTabBar, sampleTabBar) ||
                other.sampleTabBar == sampleTabBar) &&
            (identical(other.bottomNavigationState, bottomNavigationState) ||
                other.bottomNavigationState == bottomNavigationState) &&
            (identical(other.isOpenSettingsPopup, isOpenSettingsPopup) ||
                other.isOpenSettingsPopup == isOpenSettingsPopup) &&
            (identical(other.selectedSampleDataId, selectedSampleDataId) ||
                other.selectedSampleDataId == selectedSampleDataId) &&
            (identical(other.mainRoutePath, mainRoutePath) ||
                other.mainRoutePath == mainRoutePath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sampleTabBar,
      bottomNavigationState,
      isOpenSettingsPopup,
      selectedSampleDataId,
      mainRoutePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainNavigationStateCopyWith<_$_MainNavigationState> get copyWith =>
      __$$_MainNavigationStateCopyWithImpl<_$_MainNavigationState>(
          this, _$identity);
}

abstract class _MainNavigationState implements MainNavigationState {
  const factory _MainNavigationState(
      {final SampleTabBarState sampleTabBar,
      final BottomNavigationState bottomNavigationState,
      final bool isOpenSettingsPopup,
      final String? selectedSampleDataId,
      required final MainRoutePath mainRoutePath}) = _$_MainNavigationState;

  @override
  SampleTabBarState get sampleTabBar;
  @override
  BottomNavigationState get bottomNavigationState;
  @override
  bool get isOpenSettingsPopup;
  @override
  String? get selectedSampleDataId;
  @override
  MainRoutePath get mainRoutePath;
  @override
  @JsonKey(ignore: true)
  _$$_MainNavigationStateCopyWith<_$_MainNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
