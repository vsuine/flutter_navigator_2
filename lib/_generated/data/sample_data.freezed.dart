// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../data/sample_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SampleData _$SampleDataFromJson(Map<String, dynamic> json) {
  return _SampleData.fromJson(json);
}

/// @nodoc
mixin _$SampleData {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SampleDataCopyWith<SampleData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleDataCopyWith<$Res> {
  factory $SampleDataCopyWith(
          SampleData value, $Res Function(SampleData) then) =
      _$SampleDataCopyWithImpl<$Res, SampleData>;
  @useResult
  $Res call({String id, String title, String? content});
}

/// @nodoc
class _$SampleDataCopyWithImpl<$Res, $Val extends SampleData>
    implements $SampleDataCopyWith<$Res> {
  _$SampleDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SampleDataCopyWith<$Res>
    implements $SampleDataCopyWith<$Res> {
  factory _$$_SampleDataCopyWith(
          _$_SampleData value, $Res Function(_$_SampleData) then) =
      __$$_SampleDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String? content});
}

/// @nodoc
class __$$_SampleDataCopyWithImpl<$Res>
    extends _$SampleDataCopyWithImpl<$Res, _$_SampleData>
    implements _$$_SampleDataCopyWith<$Res> {
  __$$_SampleDataCopyWithImpl(
      _$_SampleData _value, $Res Function(_$_SampleData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = freezed,
  }) {
    return _then(_$_SampleData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SampleData with DiagnosticableTreeMixin implements _SampleData {
  const _$_SampleData(
      {required this.id, required this.title, this.content = null});

  factory _$_SampleData.fromJson(Map<String, dynamic> json) =>
      _$$_SampleDataFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String? content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SampleData(id: $id, title: $title, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SampleData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SampleData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SampleDataCopyWith<_$_SampleData> get copyWith =>
      __$$_SampleDataCopyWithImpl<_$_SampleData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SampleDataToJson(
      this,
    );
  }
}

abstract class _SampleData implements SampleData {
  const factory _SampleData(
      {required final String id,
      required final String title,
      final String? content}) = _$_SampleData;

  factory _SampleData.fromJson(Map<String, dynamic> json) =
      _$_SampleData.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_SampleDataCopyWith<_$_SampleData> get copyWith =>
      throw _privateConstructorUsedError;
}
