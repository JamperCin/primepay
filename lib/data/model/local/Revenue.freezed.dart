// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Revenue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Revenue _$RevenueFromJson(Map<String, dynamic> json) {
  return _Revenue.fromJson(json);
}

/// @nodoc
mixin _$Revenue {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_balance')
  String get availableBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  int get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_type')
  String get ownerType => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;

  /// Serializes this Revenue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Revenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenueCopyWith<Revenue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueCopyWith<$Res> {
  factory $RevenueCopyWith(Revenue value, $Res Function(Revenue) then) =
      _$RevenueCopyWithImpl<$Res, Revenue>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'available_balance') String availableBalance,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'owner_id') int ownerId,
      @JsonKey(name: 'owner_type') String ownerType,
      String balance});
}

/// @nodoc
class _$RevenueCopyWithImpl<$Res, $Val extends Revenue>
    implements $RevenueCopyWith<$Res> {
  _$RevenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Revenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? availableBalance = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? ownerId = null,
    Object? ownerType = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerType: null == ownerType
          ? _value.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RevenueImplCopyWith<$Res> implements $RevenueCopyWith<$Res> {
  factory _$$RevenueImplCopyWith(
          _$RevenueImpl value, $Res Function(_$RevenueImpl) then) =
      __$$RevenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'available_balance') String availableBalance,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'owner_id') int ownerId,
      @JsonKey(name: 'owner_type') String ownerType,
      String balance});
}

/// @nodoc
class __$$RevenueImplCopyWithImpl<$Res>
    extends _$RevenueCopyWithImpl<$Res, _$RevenueImpl>
    implements _$$RevenueImplCopyWith<$Res> {
  __$$RevenueImplCopyWithImpl(
      _$RevenueImpl _value, $Res Function(_$RevenueImpl) _then)
      : super(_value, _then);

  /// Create a copy of Revenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? availableBalance = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? ownerId = null,
    Object? ownerType = null,
    Object? balance = null,
  }) {
    return _then(_$RevenueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      ownerType: null == ownerType
          ? _value.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueImpl implements _Revenue {
  const _$RevenueImpl(
      {this.id = 0,
      @JsonKey(name: 'available_balance') this.availableBalance = "0.0",
      @JsonKey(name: 'created_at') this.createdAt = "",
      @JsonKey(name: 'updated_at') this.updatedAt = "",
      @JsonKey(name: 'owner_id') this.ownerId = 0,
      @JsonKey(name: 'owner_type') this.ownerType = "",
      this.balance = "0.0"});

  factory _$RevenueImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'available_balance')
  final String availableBalance;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'owner_id')
  final int ownerId;
  @override
  @JsonKey(name: 'owner_type')
  final String ownerType;
  @override
  @JsonKey()
  final String balance;

  @override
  String toString() {
    return 'Revenue(id: $id, availableBalance: $availableBalance, createdAt: $createdAt, updatedAt: $updatedAt, ownerId: $ownerId, ownerType: $ownerType, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerType, ownerType) ||
                other.ownerType == ownerType) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, availableBalance, createdAt,
      updatedAt, ownerId, ownerType, balance);

  /// Create a copy of Revenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueImplCopyWith<_$RevenueImpl> get copyWith =>
      __$$RevenueImplCopyWithImpl<_$RevenueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueImplToJson(
      this,
    );
  }
}

abstract class _Revenue implements Revenue {
  const factory _Revenue(
      {final int id,
      @JsonKey(name: 'available_balance') final String availableBalance,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'updated_at') final String updatedAt,
      @JsonKey(name: 'owner_id') final int ownerId,
      @JsonKey(name: 'owner_type') final String ownerType,
      final String balance}) = _$RevenueImpl;

  factory _Revenue.fromJson(Map<String, dynamic> json) = _$RevenueImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'available_balance')
  String get availableBalance;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'owner_id')
  int get ownerId;
  @override
  @JsonKey(name: 'owner_type')
  String get ownerType;
  @override
  String get balance;

  /// Create a copy of Revenue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueImplCopyWith<_$RevenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
