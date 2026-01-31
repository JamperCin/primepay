// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AppBaseResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppBaseResponse _$AppBaseResponseFromJson(Map<String, dynamic> json) {
  return _AppBaseResponse.fromJson(json);
}

/// @nodoc
mixin _$AppBaseResponse {
  bool get success => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_msg')
  String? get error => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  /// Serializes this AppBaseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppBaseResponseCopyWith<AppBaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBaseResponseCopyWith<$Res> {
  factory $AppBaseResponseCopyWith(
          AppBaseResponse value, $Res Function(AppBaseResponse) then) =
      _$AppBaseResponseCopyWithImpl<$Res, AppBaseResponse>;
  @useResult
  $Res call(
      {bool success,
      int status,
      @JsonKey(name: 'error_msg') String? error,
      Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$AppBaseResponseCopyWithImpl<$Res, $Val extends AppBaseResponse>
    implements $AppBaseResponseCopyWith<$Res> {
  _$AppBaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? error = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ) as $Val);
  }

  /// Create a copy of AppBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppBaseResponseImplCopyWith<$Res>
    implements $AppBaseResponseCopyWith<$Res> {
  factory _$$AppBaseResponseImplCopyWith(_$AppBaseResponseImpl value,
          $Res Function(_$AppBaseResponseImpl) then) =
      __$$AppBaseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      int status,
      @JsonKey(name: 'error_msg') String? error,
      Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AppBaseResponseImplCopyWithImpl<$Res>
    extends _$AppBaseResponseCopyWithImpl<$Res, _$AppBaseResponseImpl>
    implements _$$AppBaseResponseImplCopyWith<$Res> {
  __$$AppBaseResponseImplCopyWithImpl(
      _$AppBaseResponseImpl _value, $Res Function(_$AppBaseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
    Object? error = freezed,
    Object? data = null,
  }) {
    return _then(_$AppBaseResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppBaseResponseImpl implements _AppBaseResponse {
  const _$AppBaseResponseImpl(
      {this.success = false,
      this.status = 0,
      @JsonKey(name: 'error_msg') this.error = '',
      this.data = const Data()});

  factory _$AppBaseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppBaseResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey(name: 'error_msg')
  final String? error;
  @override
  @JsonKey()
  final Data data;

  @override
  String toString() {
    return 'AppBaseResponse(success: $success, status: $status, error: $error, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppBaseResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, status, error, data);

  /// Create a copy of AppBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppBaseResponseImplCopyWith<_$AppBaseResponseImpl> get copyWith =>
      __$$AppBaseResponseImplCopyWithImpl<_$AppBaseResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppBaseResponseImplToJson(
      this,
    );
  }
}

abstract class _AppBaseResponse implements AppBaseResponse {
  const factory _AppBaseResponse(
      {final bool success,
      final int status,
      @JsonKey(name: 'error_msg') final String? error,
      final Data data}) = _$AppBaseResponseImpl;

  factory _AppBaseResponse.fromJson(Map<String, dynamic> json) =
      _$AppBaseResponseImpl.fromJson;

  @override
  bool get success;
  @override
  int get status;
  @override
  @JsonKey(name: 'error_msg')
  String? get error;
  @override
  Data get data;

  /// Create a copy of AppBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppBaseResponseImplCopyWith<_$AppBaseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
