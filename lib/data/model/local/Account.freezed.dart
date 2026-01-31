// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_id')
  int get cardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_currency')
  String get accountCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_balance')
  String get currentBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'puchase_code')
  String get purchaseCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_discount')
  String get accountDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_status')
  String get accountStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_to')
  String get purchaseTo => throw _privateConstructorUsedError;
  PrimeCardModel get card => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  bool get gifted => throw _privateConstructorUsedError;

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'account_id') int accountId,
      @JsonKey(name: 'card_id') int cardId,
      @JsonKey(name: 'account_currency') String accountCurrency,
      @JsonKey(name: 'current_balance') String currentBalance,
      @JsonKey(name: 'puchase_code') String purchaseCode,
      @JsonKey(name: 'account_discount') String accountDiscount,
      @JsonKey(name: 'account_status') String accountStatus,
      @JsonKey(name: 'purchase_to') String purchaseTo,
      PrimeCardModel card,
      bool blocked,
      bool gifted});

  $PrimeCardModelCopyWith<$Res> get card;
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? cardId = null,
    Object? accountCurrency = null,
    Object? currentBalance = null,
    Object? purchaseCode = null,
    Object? accountDiscount = null,
    Object? accountStatus = null,
    Object? purchaseTo = null,
    Object? card = null,
    Object? blocked = null,
    Object? gifted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int,
      accountCurrency: null == accountCurrency
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseCode: null == purchaseCode
          ? _value.purchaseCode
          : purchaseCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountDiscount: null == accountDiscount
          ? _value.accountDiscount
          : accountDiscount // ignore: cast_nullable_to_non_nullable
              as String,
      accountStatus: null == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseTo: null == purchaseTo
          ? _value.purchaseTo
          : purchaseTo // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as PrimeCardModel,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      gifted: null == gifted
          ? _value.gifted
          : gifted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrimeCardModelCopyWith<$Res> get card {
    return $PrimeCardModelCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'account_id') int accountId,
      @JsonKey(name: 'card_id') int cardId,
      @JsonKey(name: 'account_currency') String accountCurrency,
      @JsonKey(name: 'current_balance') String currentBalance,
      @JsonKey(name: 'puchase_code') String purchaseCode,
      @JsonKey(name: 'account_discount') String accountDiscount,
      @JsonKey(name: 'account_status') String accountStatus,
      @JsonKey(name: 'purchase_to') String purchaseTo,
      PrimeCardModel card,
      bool blocked,
      bool gifted});

  @override
  $PrimeCardModelCopyWith<$Res> get card;
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? cardId = null,
    Object? accountCurrency = null,
    Object? currentBalance = null,
    Object? purchaseCode = null,
    Object? accountDiscount = null,
    Object? accountStatus = null,
    Object? purchaseTo = null,
    Object? card = null,
    Object? blocked = null,
    Object? gifted = null,
  }) {
    return _then(_$AccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int,
      accountCurrency: null == accountCurrency
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseCode: null == purchaseCode
          ? _value.purchaseCode
          : purchaseCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountDiscount: null == accountDiscount
          ? _value.accountDiscount
          : accountDiscount // ignore: cast_nullable_to_non_nullable
              as String,
      accountStatus: null == accountStatus
          ? _value.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseTo: null == purchaseTo
          ? _value.purchaseTo
          : purchaseTo // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as PrimeCardModel,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      gifted: null == gifted
          ? _value.gifted
          : gifted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  const _$AccountImpl(
      {this.id = 0,
      @JsonKey(name: 'account_id') this.accountId = 0,
      @JsonKey(name: 'card_id') this.cardId = 0,
      @JsonKey(name: 'account_currency') this.accountCurrency = "GHS",
      @JsonKey(name: 'current_balance') this.currentBalance = "0.0",
      @JsonKey(name: 'puchase_code') this.purchaseCode = "",
      @JsonKey(name: 'account_discount') this.accountDiscount = "",
      @JsonKey(name: 'account_status') this.accountStatus = "",
      @JsonKey(name: 'purchase_to') this.purchaseTo = "",
      this.card = const PrimeCardModel(),
      this.blocked = false,
      this.gifted = false});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  @JsonKey(name: 'card_id')
  final int cardId;
  @override
  @JsonKey(name: 'account_currency')
  final String accountCurrency;
  @override
  @JsonKey(name: 'current_balance')
  final String currentBalance;
  @override
  @JsonKey(name: 'puchase_code')
  final String purchaseCode;
  @override
  @JsonKey(name: 'account_discount')
  final String accountDiscount;
  @override
  @JsonKey(name: 'account_status')
  final String accountStatus;
  @override
  @JsonKey(name: 'purchase_to')
  final String purchaseTo;
  @override
  @JsonKey()
  final PrimeCardModel card;
  @override
  @JsonKey()
  final bool blocked;
  @override
  @JsonKey()
  final bool gifted;

  @override
  String toString() {
    return 'Account(id: $id, accountId: $accountId, cardId: $cardId, accountCurrency: $accountCurrency, currentBalance: $currentBalance, purchaseCode: $purchaseCode, accountDiscount: $accountDiscount, accountStatus: $accountStatus, purchaseTo: $purchaseTo, card: $card, blocked: $blocked, gifted: $gifted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.accountCurrency, accountCurrency) ||
                other.accountCurrency == accountCurrency) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.purchaseCode, purchaseCode) ||
                other.purchaseCode == purchaseCode) &&
            (identical(other.accountDiscount, accountDiscount) ||
                other.accountDiscount == accountDiscount) &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            (identical(other.purchaseTo, purchaseTo) ||
                other.purchaseTo == purchaseTo) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.gifted, gifted) || other.gifted == gifted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accountId,
      cardId,
      accountCurrency,
      currentBalance,
      purchaseCode,
      accountDiscount,
      accountStatus,
      purchaseTo,
      card,
      blocked,
      gifted);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {final int id,
      @JsonKey(name: 'account_id') final int accountId,
      @JsonKey(name: 'card_id') final int cardId,
      @JsonKey(name: 'account_currency') final String accountCurrency,
      @JsonKey(name: 'current_balance') final String currentBalance,
      @JsonKey(name: 'puchase_code') final String purchaseCode,
      @JsonKey(name: 'account_discount') final String accountDiscount,
      @JsonKey(name: 'account_status') final String accountStatus,
      @JsonKey(name: 'purchase_to') final String purchaseTo,
      final PrimeCardModel card,
      final bool blocked,
      final bool gifted}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  @JsonKey(name: 'card_id')
  int get cardId;
  @override
  @JsonKey(name: 'account_currency')
  String get accountCurrency;
  @override
  @JsonKey(name: 'current_balance')
  String get currentBalance;
  @override
  @JsonKey(name: 'puchase_code')
  String get purchaseCode;
  @override
  @JsonKey(name: 'account_discount')
  String get accountDiscount;
  @override
  @JsonKey(name: 'account_status')
  String get accountStatus;
  @override
  @JsonKey(name: 'purchase_to')
  String get purchaseTo;
  @override
  PrimeCardModel get card;
  @override
  bool get blocked;
  @override
  bool get gifted;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
