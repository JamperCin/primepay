import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/Customer.dart';

part 'card_account.freezed.dart';
part 'card_account.g.dart';

@freezed
class CardAccount with _$CardAccount {
  const factory CardAccount({
    @JsonKey(name: 'card_owner') @Default(Customer()) Customer cardOwner,
  }) = _CardAccount;

  factory CardAccount.fromJson(Map<String, dynamic> json) =>
      _$CardAccountFromJson(json);
}
