import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/BankAccount.dart';
import 'package:prime_pay/data/model/local/Coordinates.dart';
import 'package:prime_pay/data/model/local/Revenue.dart';

import 'Person.dart';

part 'MerchantDetails.freezed.dart';
part 'MerchantDetails.g.dart';

@freezed
class MerchantDetails with _$MerchantDetails {
  const factory MerchantDetails({
    @Default(0) int id,
    @JsonKey(name: "parent_id") @Default(0) int parentId,
    @Default('') String name,
    @Default('') String location,
    @Default('') String telephone,
    @Default('') String description,
    @Default('') String branch,
    @Default('') String email,
    @Default('') String code,
    @Default('') String address,
    @Default('') String status,
    @Default(false) bool verified,
    @Default(false) bool duplicated,
    @JsonKey(name: 'business_registration_number')
    @Default('')
        String registrationNumber,
    @JsonKey(name: 'tin_number') @Default('') String tinNumber,
    @JsonKey(name: 'website_url') @Default('') String websiteUrl,
    @JsonKey(name: 'head_office') @Default(false) bool headOffice,
    @JsonKey(name: 'logo_url') @Default('') String logoUrl,
    @JsonKey(name: 'min_card_price') @Default(0) double minPrice,
    @JsonKey(name: 'max_card_price') @Default(0) double maxPrice,
    @JsonKey(name: 'cordinates') Coordinates? coordinates,
    @JsonKey(name: 'revenue') Revenue? revenue,
    @JsonKey(name: 'bank_account') BankAccount? bankAccount,
    @JsonKey(name: 'created_at') @Default("") String createdAt,
    @JsonKey(name: 'client_type') @Default("") String? clientType,
    @JsonKey(name: 'created_by') Person? createdBy,
  }) = _MerchantDetails;

  factory MerchantDetails.fromJson(Map<String, dynamic> json) =>
      _$MerchantDetailsFromJson(json);
}
