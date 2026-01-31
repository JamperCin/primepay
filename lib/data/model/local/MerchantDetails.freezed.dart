// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MerchantDetails.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MerchantDetails _$MerchantDetailsFromJson(Map<String, dynamic> json) {
  return _MerchantDetails.fromJson(json);
}

/// @nodoc
mixin _$MerchantDetails {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_id")
  int get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get branch => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  bool get duplicated => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_registration_number')
  String get registrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'tin_number')
  String get tinNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'website_url')
  String get websiteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'head_office')
  bool get headOffice => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_card_price')
  double get minPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_card_price')
  double get maxPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'cordinates')
  Coordinates? get coordinates => throw _privateConstructorUsedError;
  @JsonKey(name: 'revenue')
  Revenue? get revenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account')
  BankAccount? get bankAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_type')
  String? get clientType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  Person? get createdBy => throw _privateConstructorUsedError;

  /// Serializes this MerchantDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MerchantDetailsCopyWith<MerchantDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantDetailsCopyWith<$Res> {
  factory $MerchantDetailsCopyWith(
          MerchantDetails value, $Res Function(MerchantDetails) then) =
      _$MerchantDetailsCopyWithImpl<$Res, MerchantDetails>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "parent_id") int parentId,
      String name,
      String location,
      String telephone,
      String description,
      String branch,
      String email,
      String code,
      String address,
      String status,
      bool verified,
      bool duplicated,
      @JsonKey(name: 'business_registration_number') String registrationNumber,
      @JsonKey(name: 'tin_number') String tinNumber,
      @JsonKey(name: 'website_url') String websiteUrl,
      @JsonKey(name: 'head_office') bool headOffice,
      @JsonKey(name: 'logo_url') String logoUrl,
      @JsonKey(name: 'min_card_price') double minPrice,
      @JsonKey(name: 'max_card_price') double maxPrice,
      @JsonKey(name: 'cordinates') Coordinates? coordinates,
      @JsonKey(name: 'revenue') Revenue? revenue,
      @JsonKey(name: 'bank_account') BankAccount? bankAccount,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'client_type') String? clientType,
      @JsonKey(name: 'created_by') Person? createdBy});

  $CoordinatesCopyWith<$Res>? get coordinates;
  $RevenueCopyWith<$Res>? get revenue;
  $BankAccountCopyWith<$Res>? get bankAccount;
  $PersonCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$MerchantDetailsCopyWithImpl<$Res, $Val extends MerchantDetails>
    implements $MerchantDetailsCopyWith<$Res> {
  _$MerchantDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = null,
    Object? name = null,
    Object? location = null,
    Object? telephone = null,
    Object? description = null,
    Object? branch = null,
    Object? email = null,
    Object? code = null,
    Object? address = null,
    Object? status = null,
    Object? verified = null,
    Object? duplicated = null,
    Object? registrationNumber = null,
    Object? tinNumber = null,
    Object? websiteUrl = null,
    Object? headOffice = null,
    Object? logoUrl = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? coordinates = freezed,
    Object? revenue = freezed,
    Object? bankAccount = freezed,
    Object? createdAt = null,
    Object? clientType = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicated: null == duplicated
          ? _value.duplicated
          : duplicated // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tinNumber: null == tinNumber
          ? _value.tinNumber
          : tinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      websiteUrl: null == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      headOffice: null == headOffice
          ? _value.headOffice
          : headOffice // ignore: cast_nullable_to_non_nullable
              as bool,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates?,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as Person?,
    ) as $Val);
  }

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res>? get coordinates {
    if (_value.coordinates == null) {
      return null;
    }

    return $CoordinatesCopyWith<$Res>(_value.coordinates!, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }

  /// Create a copy of MerchantDetails
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

  /// Create a copy of MerchantDetails
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

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $PersonCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MerchantDetailsImplCopyWith<$Res>
    implements $MerchantDetailsCopyWith<$Res> {
  factory _$$MerchantDetailsImplCopyWith(_$MerchantDetailsImpl value,
          $Res Function(_$MerchantDetailsImpl) then) =
      __$$MerchantDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "parent_id") int parentId,
      String name,
      String location,
      String telephone,
      String description,
      String branch,
      String email,
      String code,
      String address,
      String status,
      bool verified,
      bool duplicated,
      @JsonKey(name: 'business_registration_number') String registrationNumber,
      @JsonKey(name: 'tin_number') String tinNumber,
      @JsonKey(name: 'website_url') String websiteUrl,
      @JsonKey(name: 'head_office') bool headOffice,
      @JsonKey(name: 'logo_url') String logoUrl,
      @JsonKey(name: 'min_card_price') double minPrice,
      @JsonKey(name: 'max_card_price') double maxPrice,
      @JsonKey(name: 'cordinates') Coordinates? coordinates,
      @JsonKey(name: 'revenue') Revenue? revenue,
      @JsonKey(name: 'bank_account') BankAccount? bankAccount,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'client_type') String? clientType,
      @JsonKey(name: 'created_by') Person? createdBy});

  @override
  $CoordinatesCopyWith<$Res>? get coordinates;
  @override
  $RevenueCopyWith<$Res>? get revenue;
  @override
  $BankAccountCopyWith<$Res>? get bankAccount;
  @override
  $PersonCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$MerchantDetailsImplCopyWithImpl<$Res>
    extends _$MerchantDetailsCopyWithImpl<$Res, _$MerchantDetailsImpl>
    implements _$$MerchantDetailsImplCopyWith<$Res> {
  __$$MerchantDetailsImplCopyWithImpl(
      _$MerchantDetailsImpl _value, $Res Function(_$MerchantDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = null,
    Object? name = null,
    Object? location = null,
    Object? telephone = null,
    Object? description = null,
    Object? branch = null,
    Object? email = null,
    Object? code = null,
    Object? address = null,
    Object? status = null,
    Object? verified = null,
    Object? duplicated = null,
    Object? registrationNumber = null,
    Object? tinNumber = null,
    Object? websiteUrl = null,
    Object? headOffice = null,
    Object? logoUrl = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? coordinates = freezed,
    Object? revenue = freezed,
    Object? bankAccount = freezed,
    Object? createdAt = null,
    Object? clientType = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_$MerchantDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      duplicated: null == duplicated
          ? _value.duplicated
          : duplicated // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tinNumber: null == tinNumber
          ? _value.tinNumber
          : tinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      websiteUrl: null == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      headOffice: null == headOffice
          ? _value.headOffice
          : headOffice // ignore: cast_nullable_to_non_nullable
              as bool,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates?,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as Person?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantDetailsImpl implements _MerchantDetails {
  const _$MerchantDetailsImpl(
      {this.id = 0,
      @JsonKey(name: "parent_id") this.parentId = 0,
      this.name = '',
      this.location = '',
      this.telephone = '',
      this.description = '',
      this.branch = '',
      this.email = '',
      this.code = '',
      this.address = '',
      this.status = '',
      this.verified = false,
      this.duplicated = false,
      @JsonKey(name: 'business_registration_number')
      this.registrationNumber = '',
      @JsonKey(name: 'tin_number') this.tinNumber = '',
      @JsonKey(name: 'website_url') this.websiteUrl = '',
      @JsonKey(name: 'head_office') this.headOffice = false,
      @JsonKey(name: 'logo_url') this.logoUrl = '',
      @JsonKey(name: 'min_card_price') this.minPrice = 0,
      @JsonKey(name: 'max_card_price') this.maxPrice = 0,
      @JsonKey(name: 'cordinates') this.coordinates,
      @JsonKey(name: 'revenue') this.revenue,
      @JsonKey(name: 'bank_account') this.bankAccount,
      @JsonKey(name: 'created_at') this.createdAt = "",
      @JsonKey(name: 'client_type') this.clientType = "",
      @JsonKey(name: 'created_by') this.createdBy});

  factory _$MerchantDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantDetailsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: "parent_id")
  final int parentId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String telephone;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String branch;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final bool verified;
  @override
  @JsonKey()
  final bool duplicated;
  @override
  @JsonKey(name: 'business_registration_number')
  final String registrationNumber;
  @override
  @JsonKey(name: 'tin_number')
  final String tinNumber;
  @override
  @JsonKey(name: 'website_url')
  final String websiteUrl;
  @override
  @JsonKey(name: 'head_office')
  final bool headOffice;
  @override
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @override
  @JsonKey(name: 'min_card_price')
  final double minPrice;
  @override
  @JsonKey(name: 'max_card_price')
  final double maxPrice;
  @override
  @JsonKey(name: 'cordinates')
  final Coordinates? coordinates;
  @override
  @JsonKey(name: 'revenue')
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
  @JsonKey(name: 'created_by')
  final Person? createdBy;

  @override
  String toString() {
    return 'MerchantDetails(id: $id, parentId: $parentId, name: $name, location: $location, telephone: $telephone, description: $description, branch: $branch, email: $email, code: $code, address: $address, status: $status, verified: $verified, duplicated: $duplicated, registrationNumber: $registrationNumber, tinNumber: $tinNumber, websiteUrl: $websiteUrl, headOffice: $headOffice, logoUrl: $logoUrl, minPrice: $minPrice, maxPrice: $maxPrice, coordinates: $coordinates, revenue: $revenue, bankAccount: $bankAccount, createdAt: $createdAt, clientType: $clientType, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.duplicated, duplicated) ||
                other.duplicated == duplicated) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.tinNumber, tinNumber) ||
                other.tinNumber == tinNumber) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.headOffice, headOffice) ||
                other.headOffice == headOffice) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.clientType, clientType) ||
                other.clientType == clientType) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        parentId,
        name,
        location,
        telephone,
        description,
        branch,
        email,
        code,
        address,
        status,
        verified,
        duplicated,
        registrationNumber,
        tinNumber,
        websiteUrl,
        headOffice,
        logoUrl,
        minPrice,
        maxPrice,
        coordinates,
        revenue,
        bankAccount,
        createdAt,
        clientType,
        createdBy
      ]);

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantDetailsImplCopyWith<_$MerchantDetailsImpl> get copyWith =>
      __$$MerchantDetailsImplCopyWithImpl<_$MerchantDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantDetailsImplToJson(
      this,
    );
  }
}

abstract class _MerchantDetails implements MerchantDetails {
  const factory _MerchantDetails(
          {final int id,
          @JsonKey(name: "parent_id") final int parentId,
          final String name,
          final String location,
          final String telephone,
          final String description,
          final String branch,
          final String email,
          final String code,
          final String address,
          final String status,
          final bool verified,
          final bool duplicated,
          @JsonKey(name: 'business_registration_number')
          final String registrationNumber,
          @JsonKey(name: 'tin_number') final String tinNumber,
          @JsonKey(name: 'website_url') final String websiteUrl,
          @JsonKey(name: 'head_office') final bool headOffice,
          @JsonKey(name: 'logo_url') final String logoUrl,
          @JsonKey(name: 'min_card_price') final double minPrice,
          @JsonKey(name: 'max_card_price') final double maxPrice,
          @JsonKey(name: 'cordinates') final Coordinates? coordinates,
          @JsonKey(name: 'revenue') final Revenue? revenue,
          @JsonKey(name: 'bank_account') final BankAccount? bankAccount,
          @JsonKey(name: 'created_at') final String createdAt,
          @JsonKey(name: 'client_type') final String? clientType,
          @JsonKey(name: 'created_by') final Person? createdBy}) =
      _$MerchantDetailsImpl;

  factory _MerchantDetails.fromJson(Map<String, dynamic> json) =
      _$MerchantDetailsImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "parent_id")
  int get parentId;
  @override
  String get name;
  @override
  String get location;
  @override
  String get telephone;
  @override
  String get description;
  @override
  String get branch;
  @override
  String get email;
  @override
  String get code;
  @override
  String get address;
  @override
  String get status;
  @override
  bool get verified;
  @override
  bool get duplicated;
  @override
  @JsonKey(name: 'business_registration_number')
  String get registrationNumber;
  @override
  @JsonKey(name: 'tin_number')
  String get tinNumber;
  @override
  @JsonKey(name: 'website_url')
  String get websiteUrl;
  @override
  @JsonKey(name: 'head_office')
  bool get headOffice;
  @override
  @JsonKey(name: 'logo_url')
  String get logoUrl;
  @override
  @JsonKey(name: 'min_card_price')
  double get minPrice;
  @override
  @JsonKey(name: 'max_card_price')
  double get maxPrice;
  @override
  @JsonKey(name: 'cordinates')
  Coordinates? get coordinates;
  @override
  @JsonKey(name: 'revenue')
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
  @override
  @JsonKey(name: 'created_by')
  Person? get createdBy;

  /// Create a copy of MerchantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MerchantDetailsImplCopyWith<_$MerchantDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
