import 'package:freezed_annotation/freezed_annotation.dart';

import 'BankAccount.dart';
import 'Revenue.dart';

part 'companies.freezed.dart';
part 'companies.g.dart';

@freezed
class Companies with _$Companies {
  const factory Companies({
    @Default('') String name,
    @Default('') String email,
    @Default('') String telephone,
    @Default('') String code,
    @Default('') String description,
    @Default('') String address,
    @Default(0) int id,
    @JsonKey(name: 'head_office') @Default(false) bool isHeadOffice,
    Revenue? revenue,
    @JsonKey(name: 'bank_account') BankAccount? bankAccount,
    @JsonKey(name: 'created_at') @Default("") String createdAt,
    @JsonKey(name: 'client_type') @Default("") String? clientType,
  }) = _Companies;

  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);
}
