// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'signup_user')
  Customer get signupUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_token')
  VerifiedToken get verifiedToken => throw _privateConstructorUsedError;
  MerchantDetails get merchant => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_url')
  String get paymentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_details')
  Customer get userDetails => throw _privateConstructorUsedError;
  AppUpdateMeta get meta => throw _privateConstructorUsedError;
  Account get account => throw _privateConstructorUsedError;
  List<RedemptionsModel> get redemptions => throw _privateConstructorUsedError;
  List<DisbursementModel> get disbursements =>
      throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'signup_user') Customer signupUser,
      @JsonKey(name: 'verified_token') VerifiedToken verifiedToken,
      MerchantDetails merchant,
      String token,
      @JsonKey(name: 'payment_url') String paymentUrl,
      @JsonKey(name: 'user_details') Customer userDetails,
      AppUpdateMeta meta,
      Account account,
      List<RedemptionsModel> redemptions,
      List<DisbursementModel> disbursements});

  $CustomerCopyWith<$Res> get signupUser;
  $VerifiedTokenCopyWith<$Res> get verifiedToken;
  $MerchantDetailsCopyWith<$Res> get merchant;
  $CustomerCopyWith<$Res> get userDetails;
  $AppUpdateMetaCopyWith<$Res> get meta;
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupUser = null,
    Object? verifiedToken = null,
    Object? merchant = null,
    Object? token = null,
    Object? paymentUrl = null,
    Object? userDetails = null,
    Object? meta = null,
    Object? account = null,
    Object? redemptions = null,
    Object? disbursements = null,
  }) {
    return _then(_value.copyWith(
      signupUser: null == signupUser
          ? _value.signupUser
          : signupUser // ignore: cast_nullable_to_non_nullable
              as Customer,
      verifiedToken: null == verifiedToken
          ? _value.verifiedToken
          : verifiedToken // ignore: cast_nullable_to_non_nullable
              as VerifiedToken,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as MerchantDetails,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as Customer,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AppUpdateMeta,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      redemptions: null == redemptions
          ? _value.redemptions
          : redemptions // ignore: cast_nullable_to_non_nullable
              as List<RedemptionsModel>,
      disbursements: null == disbursements
          ? _value.disbursements
          : disbursements // ignore: cast_nullable_to_non_nullable
              as List<DisbursementModel>,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get signupUser {
    return $CustomerCopyWith<$Res>(_value.signupUser, (value) {
      return _then(_value.copyWith(signupUser: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerifiedTokenCopyWith<$Res> get verifiedToken {
    return $VerifiedTokenCopyWith<$Res>(_value.verifiedToken, (value) {
      return _then(_value.copyWith(verifiedToken: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MerchantDetailsCopyWith<$Res> get merchant {
    return $MerchantDetailsCopyWith<$Res>(_value.merchant, (value) {
      return _then(_value.copyWith(merchant: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get userDetails {
    return $CustomerCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUpdateMetaCopyWith<$Res> get meta {
    return $AppUpdateMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'signup_user') Customer signupUser,
      @JsonKey(name: 'verified_token') VerifiedToken verifiedToken,
      MerchantDetails merchant,
      String token,
      @JsonKey(name: 'payment_url') String paymentUrl,
      @JsonKey(name: 'user_details') Customer userDetails,
      AppUpdateMeta meta,
      Account account,
      List<RedemptionsModel> redemptions,
      List<DisbursementModel> disbursements});

  @override
  $CustomerCopyWith<$Res> get signupUser;
  @override
  $VerifiedTokenCopyWith<$Res> get verifiedToken;
  @override
  $MerchantDetailsCopyWith<$Res> get merchant;
  @override
  $CustomerCopyWith<$Res> get userDetails;
  @override
  $AppUpdateMetaCopyWith<$Res> get meta;
  @override
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signupUser = null,
    Object? verifiedToken = null,
    Object? merchant = null,
    Object? token = null,
    Object? paymentUrl = null,
    Object? userDetails = null,
    Object? meta = null,
    Object? account = null,
    Object? redemptions = null,
    Object? disbursements = null,
  }) {
    return _then(_$DataImpl(
      signupUser: null == signupUser
          ? _value.signupUser
          : signupUser // ignore: cast_nullable_to_non_nullable
              as Customer,
      verifiedToken: null == verifiedToken
          ? _value.verifiedToken
          : verifiedToken // ignore: cast_nullable_to_non_nullable
              as VerifiedToken,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as MerchantDetails,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as Customer,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as AppUpdateMeta,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      redemptions: null == redemptions
          ? _value._redemptions
          : redemptions // ignore: cast_nullable_to_non_nullable
              as List<RedemptionsModel>,
      disbursements: null == disbursements
          ? _value._disbursements
          : disbursements // ignore: cast_nullable_to_non_nullable
              as List<DisbursementModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'signup_user') this.signupUser = const Customer(),
      @JsonKey(name: 'verified_token')
      this.verifiedToken = const VerifiedToken(),
      this.merchant = const MerchantDetails(),
      this.token = '',
      @JsonKey(name: 'payment_url') this.paymentUrl = '',
      @JsonKey(name: 'user_details') this.userDetails = const Customer(),
      this.meta = const AppUpdateMeta(),
      this.account = const Account(),
      final List<RedemptionsModel> redemptions = const <RedemptionsModel>[],
      final List<DisbursementModel> disbursements =
          const <DisbursementModel>[]})
      : _redemptions = redemptions,
        _disbursements = disbursements;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: 'signup_user')
  final Customer signupUser;
  @override
  @JsonKey(name: 'verified_token')
  final VerifiedToken verifiedToken;
  @override
  @JsonKey()
  final MerchantDetails merchant;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey(name: 'payment_url')
  final String paymentUrl;
  @override
  @JsonKey(name: 'user_details')
  final Customer userDetails;
  @override
  @JsonKey()
  final AppUpdateMeta meta;
  @override
  @JsonKey()
  final Account account;
  final List<RedemptionsModel> _redemptions;
  @override
  @JsonKey()
  List<RedemptionsModel> get redemptions {
    if (_redemptions is EqualUnmodifiableListView) return _redemptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_redemptions);
  }

  final List<DisbursementModel> _disbursements;
  @override
  @JsonKey()
  List<DisbursementModel> get disbursements {
    if (_disbursements is EqualUnmodifiableListView) return _disbursements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disbursements);
  }

  @override
  String toString() {
    return 'Data(signupUser: $signupUser, verifiedToken: $verifiedToken, merchant: $merchant, token: $token, paymentUrl: $paymentUrl, userDetails: $userDetails, meta: $meta, account: $account, redemptions: $redemptions, disbursements: $disbursements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.signupUser, signupUser) ||
                other.signupUser == signupUser) &&
            (identical(other.verifiedToken, verifiedToken) ||
                other.verifiedToken == verifiedToken) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality()
                .equals(other._redemptions, _redemptions) &&
            const DeepCollectionEquality()
                .equals(other._disbursements, _disbursements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      signupUser,
      verifiedToken,
      merchant,
      token,
      paymentUrl,
      userDetails,
      meta,
      account,
      const DeepCollectionEquality().hash(_redemptions),
      const DeepCollectionEquality().hash(_disbursements));

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: 'signup_user') final Customer signupUser,
      @JsonKey(name: 'verified_token') final VerifiedToken verifiedToken,
      final MerchantDetails merchant,
      final String token,
      @JsonKey(name: 'payment_url') final String paymentUrl,
      @JsonKey(name: 'user_details') final Customer userDetails,
      final AppUpdateMeta meta,
      final Account account,
      final List<RedemptionsModel> redemptions,
      final List<DisbursementModel> disbursements}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: 'signup_user')
  Customer get signupUser;
  @override
  @JsonKey(name: 'verified_token')
  VerifiedToken get verifiedToken;
  @override
  MerchantDetails get merchant;
  @override
  String get token;
  @override
  @JsonKey(name: 'payment_url')
  String get paymentUrl;
  @override
  @JsonKey(name: 'user_details')
  Customer get userDetails;
  @override
  AppUpdateMeta get meta;
  @override
  Account get account;
  @override
  List<RedemptionsModel> get redemptions;
  @override
  List<DisbursementModel> get disbursements;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
