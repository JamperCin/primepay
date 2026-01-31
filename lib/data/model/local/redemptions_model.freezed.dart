// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redemptions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RedemptionsModel _$RedemptionsModelFromJson(Map<String, dynamic> json) {
  return _RedemptionsModel.fromJson(json);
}

/// @nodoc
mixin _$RedemptionsModel {
  int get id => throw _privateConstructorUsedError;
  String get merchant => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_redemption_amount')
  String get redemptionAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type')
  String get transactionType => throw _privateConstructorUsedError;
  Person get person => throw _privateConstructorUsedError;
  @JsonKey(name: 'person_info')
  Person get personInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_account')
  CardAccount get cardAccount => throw _privateConstructorUsedError;

  /// Serializes this RedemptionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedemptionsModelCopyWith<RedemptionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedemptionsModelCopyWith<$Res> {
  factory $RedemptionsModelCopyWith(
          RedemptionsModel value, $Res Function(RedemptionsModel) then) =
      _$RedemptionsModelCopyWithImpl<$Res, RedemptionsModel>;
  @useResult
  $Res call(
      {int id,
      String merchant,
      String amount,
      @JsonKey(name: 'card_redemption_amount') String redemptionAmount,
      String status,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'transaction_type') String transactionType,
      Person person,
      @JsonKey(name: 'person_info') Person personInfo,
      @JsonKey(name: 'card_account') CardAccount cardAccount});

  $PersonCopyWith<$Res> get person;
  $PersonCopyWith<$Res> get personInfo;
  $CardAccountCopyWith<$Res> get cardAccount;
}

/// @nodoc
class _$RedemptionsModelCopyWithImpl<$Res, $Val extends RedemptionsModel>
    implements $RedemptionsModelCopyWith<$Res> {
  _$RedemptionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchant = null,
    Object? amount = null,
    Object? redemptionAmount = null,
    Object? status = null,
    Object? createdAt = null,
    Object? transactionType = null,
    Object? person = null,
    Object? personInfo = null,
    Object? cardAccount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      redemptionAmount: null == redemptionAmount
          ? _value.redemptionAmount
          : redemptionAmount // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      personInfo: null == personInfo
          ? _value.personInfo
          : personInfo // ignore: cast_nullable_to_non_nullable
              as Person,
      cardAccount: null == cardAccount
          ? _value.cardAccount
          : cardAccount // ignore: cast_nullable_to_non_nullable
              as CardAccount,
    ) as $Val);
  }

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get person {
    return $PersonCopyWith<$Res>(_value.person, (value) {
      return _then(_value.copyWith(person: value) as $Val);
    });
  }

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get personInfo {
    return $PersonCopyWith<$Res>(_value.personInfo, (value) {
      return _then(_value.copyWith(personInfo: value) as $Val);
    });
  }

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardAccountCopyWith<$Res> get cardAccount {
    return $CardAccountCopyWith<$Res>(_value.cardAccount, (value) {
      return _then(_value.copyWith(cardAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RedemptionsModelImplCopyWith<$Res>
    implements $RedemptionsModelCopyWith<$Res> {
  factory _$$RedemptionsModelImplCopyWith(_$RedemptionsModelImpl value,
          $Res Function(_$RedemptionsModelImpl) then) =
      __$$RedemptionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String merchant,
      String amount,
      @JsonKey(name: 'card_redemption_amount') String redemptionAmount,
      String status,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'transaction_type') String transactionType,
      Person person,
      @JsonKey(name: 'person_info') Person personInfo,
      @JsonKey(name: 'card_account') CardAccount cardAccount});

  @override
  $PersonCopyWith<$Res> get person;
  @override
  $PersonCopyWith<$Res> get personInfo;
  @override
  $CardAccountCopyWith<$Res> get cardAccount;
}

/// @nodoc
class __$$RedemptionsModelImplCopyWithImpl<$Res>
    extends _$RedemptionsModelCopyWithImpl<$Res, _$RedemptionsModelImpl>
    implements _$$RedemptionsModelImplCopyWith<$Res> {
  __$$RedemptionsModelImplCopyWithImpl(_$RedemptionsModelImpl _value,
      $Res Function(_$RedemptionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchant = null,
    Object? amount = null,
    Object? redemptionAmount = null,
    Object? status = null,
    Object? createdAt = null,
    Object? transactionType = null,
    Object? person = null,
    Object? personInfo = null,
    Object? cardAccount = null,
  }) {
    return _then(_$RedemptionsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      redemptionAmount: null == redemptionAmount
          ? _value.redemptionAmount
          : redemptionAmount // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      personInfo: null == personInfo
          ? _value.personInfo
          : personInfo // ignore: cast_nullable_to_non_nullable
              as Person,
      cardAccount: null == cardAccount
          ? _value.cardAccount
          : cardAccount // ignore: cast_nullable_to_non_nullable
              as CardAccount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RedemptionsModelImpl implements _RedemptionsModel {
  const _$RedemptionsModelImpl(
      {this.id = 0,
      this.merchant = '',
      this.amount = '',
      @JsonKey(name: 'card_redemption_amount') this.redemptionAmount = '',
      this.status = '',
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'transaction_type') this.transactionType = '',
      this.person = const Person(),
      @JsonKey(name: 'person_info') this.personInfo = const Person(),
      @JsonKey(name: 'card_account') this.cardAccount = const CardAccount()});

  factory _$RedemptionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedemptionsModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String merchant;
  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey(name: 'card_redemption_amount')
  final String redemptionAmount;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'transaction_type')
  final String transactionType;
  @override
  @JsonKey()
  final Person person;
  @override
  @JsonKey(name: 'person_info')
  final Person personInfo;
  @override
  @JsonKey(name: 'card_account')
  final CardAccount cardAccount;

  @override
  String toString() {
    return 'RedemptionsModel(id: $id, merchant: $merchant, amount: $amount, redemptionAmount: $redemptionAmount, status: $status, createdAt: $createdAt, transactionType: $transactionType, person: $person, personInfo: $personInfo, cardAccount: $cardAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedemptionsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.redemptionAmount, redemptionAmount) ||
                other.redemptionAmount == redemptionAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.personInfo, personInfo) ||
                other.personInfo == personInfo) &&
            (identical(other.cardAccount, cardAccount) ||
                other.cardAccount == cardAccount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      merchant,
      amount,
      redemptionAmount,
      status,
      createdAt,
      transactionType,
      person,
      personInfo,
      cardAccount);

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedemptionsModelImplCopyWith<_$RedemptionsModelImpl> get copyWith =>
      __$$RedemptionsModelImplCopyWithImpl<_$RedemptionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RedemptionsModelImplToJson(
      this,
    );
  }
}

abstract class _RedemptionsModel implements RedemptionsModel {
  const factory _RedemptionsModel(
      {final int id,
      final String merchant,
      final String amount,
      @JsonKey(name: 'card_redemption_amount') final String redemptionAmount,
      final String status,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'transaction_type') final String transactionType,
      final Person person,
      @JsonKey(name: 'person_info') final Person personInfo,
      @JsonKey(name: 'card_account')
      final CardAccount cardAccount}) = _$RedemptionsModelImpl;

  factory _RedemptionsModel.fromJson(Map<String, dynamic> json) =
      _$RedemptionsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get merchant;
  @override
  String get amount;
  @override
  @JsonKey(name: 'card_redemption_amount')
  String get redemptionAmount;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'transaction_type')
  String get transactionType;
  @override
  Person get person;
  @override
  @JsonKey(name: 'person_info')
  Person get personInfo;
  @override
  @JsonKey(name: 'card_account')
  CardAccount get cardAccount;

  /// Create a copy of RedemptionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedemptionsModelImplCopyWith<_$RedemptionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
