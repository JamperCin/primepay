import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/PrimeCardModel.dart';

part 'Account.freezed.dart';
part 'Account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @Default(0) int id,
    @JsonKey(name: 'account_id') @Default(0) int accountId,
    @JsonKey(name: 'card_id') @Default(0) int cardId,
    @JsonKey(name: 'account_currency') @Default("GHS") String accountCurrency,
    @JsonKey(name: 'current_balance') @Default("0.0") String currentBalance,
    @JsonKey(name: 'puchase_code') @Default("") String purchaseCode,
    @JsonKey(name: 'account_discount') @Default("") String accountDiscount,
    @JsonKey(name: 'account_status') @Default("") String accountStatus,
    @JsonKey(name: 'purchase_to') @Default("") String purchaseTo,
    @Default(PrimeCardModel()) PrimeCardModel card,
    @Default(false) bool blocked,
    @Default(false) bool gifted,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
