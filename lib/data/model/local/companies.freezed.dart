// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Companies _$CompaniesFromJson(Map<String, dynamic> json) {
  return _Companies.fromJson(json);
}

/// @nodoc
mixin _$Companies {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'head_office')
  bool get isHeadOffice => throw _privateConstructorUsedError;
  Revenue? get revenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account')
  BankAccount? get bankAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_type')
  String? get clientType => throw _privateConstructorUsedError;

  /// Serializes this Companies to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Companies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompaniesCopyWith<Companies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompaniesCopyWith<$Res> {
  factory $CompaniesCopyWith(Companies value, $Res Function(Companies) then) =
      _$CompaniesCopyWithImpl<$Res, Companies>;
  @useResult
  $Res call(
      {String name,
      String email,
      String telephone,
      String code,
      String description,
      String address,
      int id,
      @JsonKey(name: 'head_office') bool isHeadOffice,
      Revenue? revenue,
      @JsonKey(name: 'bank_account') BankAccount? bankAccount,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'client_type') String? clientType});

  $RevenueCopyWith<$Res>? get revenue;
  $BankAccountCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class _$CompaniesCopyWithImpl<$Res, $Val extends Companies>
    implements $CompaniesCopyWith<$Res> {
  _$CompaniesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Companies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? telephone = null,
    Object? code = null,
    Object? description = null,
    Object? address = null,
    Object? id = null,
    Object? isHeadOffice = null,
    Object? revenue = freezed,
    Object? bankAccount = freezed,
    Object? createdAt = null,
    Object? clientType = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isHeadOffice: null == isHeadOffice
          ? _value.isHeadOffice
          : isHeadOffice // ignore: cast_nullable_to_non_nullable
              as bool,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as Revenue?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      clientType: freezed == clientType
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Companies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RevenueCopyWith<$Res>? get revenue {
    if (_value.revenue == null) {
      return null;
    }

    return $RevenueCopyWith<$Res>(_value.revenue!, (value) {
      return _then(_value.copyWith(revenue: value) as $Val);
    });
  }

  /// Create a copy of Companies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<$Res>? get bankAccount {
    if (_value.bankAccount == null) {
      return null;
    }

    return $BankAccountCopyWith<$Res>(_value.bankAccount!, (value) {
      return _then(_value.copyWith(bankAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompaniesImplCopyWith<$Res>
    implements $CompaniesCopyWith<$Res> {
  factory _$$CompaniesImplCopyWith(
          _$CompaniesImpl value, $Res Function(_$CompaniesImpl) then) =
      __$$CompaniesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String telephone,
      String code,
      String description,
      String address,
      int id,
      @JsonKey(name: 'head_office') bool isHeadOffice,
      Revenue? revenue,
      @JsonKey(name: 'bank_account') BankAccount? bankAccount,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'client_type') String? clientType});

  @override
  $RevenueCopyWith<$Res>? get revenue;
  @override
  $BankAccountCopyWith<$Res>? get bankAccount;
}

/// @nodoc
class __$$CompaniesImplCopyWithImpl<$Res>
    extends _$CompaniesCopyWithImpl<$Res, _$CompaniesImpl>
    implements _$$CompaniesImplCopyWith<$Res> {
  __$$CompaniesImplCopyWithImpl(
      _$CompaniesImpl _value, $Res Function(_$CompaniesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Companies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? telephone = null,
    Object? code = null,
    Object? description = null,
    Object? address = null,
    Object? id = null,
    Object? isHeadOffice = null,
    Object? revenue = freezed,
    Object? bankAccount = freezed,
    Object? createdAt = null,
    Object? clientType = freezed,
  }) {
    return _then(_$CompaniesImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isHeadOffice: null == isHeadOffice
          ? _value.isHeadOffice
          : isHeadOffice // ignore: cast_nullable_to_non_nullable
              as bool,
      revenue: freezed == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as Revenue?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      clientType: freezed == clientType
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompaniesImpl implements _Companies {
  const _$CompaniesImpl(
      {this.name = '',
      this.email = '',
      this.telephone = '',
      this.code = '',
      this.description = '',
      this.address = '',
      this.id = 0,
      @JsonKey(name: 'head_office') this.isHeadOffice = false,
      this.revenue,
      @JsonKey(name: 'bank_account') this.bankAccount,
      @JsonKey(name: 'created_at') this.createdAt = "",
      @JsonKey(name: 'client_type') this.clientType = ""});

  factory _$CompaniesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompaniesImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String telephone;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'head_office')
  final bool isHeadOffice;
  @override
  final Revenue? revenue;
  @override
  @JsonKey(name: 'bank_account')
  final BankAccount? bankAccount;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'client_type')
  final String? clientType;

  @override
  String toString() {
    return 'Companies(name: $name, email: $email, telephone: $telephone, code: $code, description: $description, address: $address, id: $id, isHeadOffice: $isHeadOffice, revenue: $revenue, bankAccount: $bankAccount, createdAt: $createdAt, clientType: $clientType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompaniesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isHeadOffice, isHeadOffice) ||
                other.isHeadOffice == isHeadOffice) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.clientType, clientType) ||
                other.clientType == clientType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      telephone,
      code,
      description,
      address,
      id,
      isHeadOffice,
      revenue,
      bankAccount,
      createdAt,
      clientType);

  /// Create a copy of Companies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompaniesImplCopyWith<_$CompaniesImpl> get copyWith =>
      __$$CompaniesImplCopyWithImpl<_$CompaniesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompaniesImplToJson(
      this,
    );
  }
}

abstract class _Companies implements Companies {
  const factory _Companies(
          {final String name,
          final String email,
          final String telephone,
          final String code,
          final String description,
          final String address,
          final int id,
          @JsonKey(name: 'head_office') final bool isHeadOffice,
          final Revenue? revenue,
          @JsonKey(name: 'bank_account') final BankAccount? bankAccount,
          @JsonKey(name: 'created_at') final String createdAt,
          @JsonKey(name: 'client_type') final String? clientType}) =
      _$CompaniesImpl;

  factory _Companies.fromJson(Map<String, dynamic> json) =
      _$CompaniesImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get telephone;
  @override
  String get code;
  @override
  String get description;
  @override
  String get address;
  @override
  int get id;
  @override
  @JsonKey(name: 'head_office')
  bool get isHeadOffice;
  @override
  Revenue? get revenue;
  @override
  @JsonKey(name: 'bank_account')
  BankAccount? get bankAccount;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'client_type')
  String? get clientType;

  /// Create a copy of Companies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompaniesImplCopyWith<_$CompaniesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
