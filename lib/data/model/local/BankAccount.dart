import 'package:freezed_annotation/freezed_annotation.dart';

part 'BankAccount.freezed.dart';
part 'BankAccount.g.dart';

@freezed
class BankAccount with _$BankAccount {
  const factory BankAccount({
    @Default(0) int id,
    @Default("") String bank,
    @Default("") String name,
    @Default("") String number,
    @JsonKey(name: 'created_at') @Default("") String createdAt,
    @JsonKey(name: 'account_type') @Default("") String accountType,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}
