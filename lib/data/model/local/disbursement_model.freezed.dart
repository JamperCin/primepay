// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disbursement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DisbursementModel _$DisbursementModelFromJson(Map<String, dynamic> json) {
  return _DisbursementModel.fromJson(json);
}

/// @nodoc
mixin _$DisbursementModel {
  int get id => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_name')
  String get merchantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  List<PaymentModel> get payments => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_transaction')
  RedemptionsModel get redemption => throw _privateConstructorUsedError;

  /// Serializes this DisbursementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisbursementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisbursementModelCopyWith<DisbursementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisbursementModelCopyWith<$Res> {
  factory $DisbursementModelCopyWith(
          DisbursementModel value, $Res Function(DisbursementModel) then) =
      _$DisbursementModelCopyWithImpl<$Res, DisbursementModel>;
  @useResult
  $Res call(
      {int id,
      String state,
      @JsonKey(name: 'client_name') String merchantName,
      @JsonKey(name: 'created_at') String createdAt,
      List<PaymentModel> payments,
      @JsonKey(name: 'related_transaction') RedemptionsModel redemption});

  $RedemptionsModelCopyWith<$Res> get redemption;
}

/// @nodoc
class _$DisbursementModelCopyWithImpl<$Res, $Val extends DisbursementModel>
    implements $DisbursementModelCopyWith<$Res> {
  _$DisbursementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisbursementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
    Object? merchantName = null,
    Object? createdAt = null,
    Object? payments = null,
    Object? redemption = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      merchantName: null == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
      redemption: null == redemption
          ? _value.redemption
          : redemption // ignore: cast_nullable_to_non_nullable
              as RedemptionsModel,
    ) as $Val);
  }

  /// Create a copy of DisbursementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RedemptionsModelCopyWith<$Res> get redemption {
    return $RedemptionsModelCopyWith<$Res>(_value.redemption, (value) {
      return _then(_value.copyWith(redemption: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DisbursementModelImplCopyWith<$Res>
    implements $DisbursementModelCopyWith<$Res> {
  factory _$$DisbursementModelImplCopyWith(_$DisbursementModelImpl value,
          $Res Function(_$DisbursementModelImpl) then) =
      __$$DisbursementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String state,
      @JsonKey(name: 'client_name') String merchantName,
      @JsonKey(name: 'created_at') String createdAt,
      List<PaymentModel> payments,
      @JsonKey(name: 'related_transaction') RedemptionsModel redemption});

  @override
  $RedemptionsModelCopyWith<$Res> get redemption;
}

/// @nodoc
class __$$DisbursementModelImplCopyWithImpl<$Res>
    extends _$DisbursementModelCopyWithImpl<$Res, _$DisbursementModelImpl>
    implements _$$DisbursementModelImplCopyWith<$Res> {
  __$$DisbursementModelImplCopyWithImpl(_$DisbursementModelImpl _value,
      $Res Function(_$DisbursementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisbursementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
    Object? merchantName = null,
    Object? createdAt = null,
    Object? payments = null,
    Object? redemption = null,
  }) {
    return _then(_$DisbursementModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      merchantName: null == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      payments: null == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
      redemption: null == redemption
          ? _value.redemption
          : redemption // ignore: cast_nullable_to_non_nullable
              as RedemptionsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisbursementModelImpl implements _DisbursementModel {
  const _$DisbursementModelImpl(
      {this.id = 0,
      this.state = '',
      @JsonKey(name: 'client_name') this.merchantName = '',
      @JsonKey(name: 'created_at') this.createdAt = '',
      final List<PaymentModel> payments = const <PaymentModel>[],
      @JsonKey(name: 'related_transaction')
      this.redemption = const RedemptionsModel()})
      : _payments = payments;

  factory _$DisbursementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisbursementModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey(name: 'client_name')
  final String merchantName;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  final List<PaymentModel> _payments;
  @override
  @JsonKey()
  List<PaymentModel> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  @override
  @JsonKey(name: 'related_transaction')
  final RedemptionsModel redemption;

  @override
  String toString() {
    return 'DisbursementModel(id: $id, state: $state, merchantName: $merchantName, createdAt: $createdAt, payments: $payments, redemption: $redemption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisbursementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            (identical(other.redemption, redemption) ||
                other.redemption == redemption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, state, merchantName,
      createdAt, const DeepCollectionEquality().hash(_payments), redemption);

  /// Create a copy of DisbursementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisbursementModelImplCopyWith<_$DisbursementModelImpl> get copyWith =>
      __$$DisbursementModelImplCopyWithImpl<_$DisbursementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisbursementModelImplToJson(
      this,
    );
  }
}

abstract class _DisbursementModel implements DisbursementModel {
  const factory _DisbursementModel(
      {final int id,
      final String state,
      @JsonKey(name: 'client_name') final String merchantName,
      @JsonKey(name: 'created_at') final String createdAt,
      final List<PaymentModel> payments,
      @JsonKey(name: 'related_transaction')
      final RedemptionsModel redemption}) = _$DisbursementModelImpl;

  factory _DisbursementModel.fromJson(Map<String, dynamic> json) =
      _$DisbursementModelImpl.fromJson;

  @override
  int get id;
  @override
  String get state;
  @override
  @JsonKey(name: 'client_name')
  String get merchantName;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  List<PaymentModel> get payments;
  @override
  @JsonKey(name: 'related_transaction')
  RedemptionsModel get redemption;

  /// Create a copy of DisbursementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisbursementModelImplCopyWith<_$DisbursementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
