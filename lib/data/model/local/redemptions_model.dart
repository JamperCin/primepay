import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/Person.dart';

import 'card_account.dart';

part 'redemptions_model.freezed.dart';
part 'redemptions_model.g.dart';

@freezed
class RedemptionsModel with _$RedemptionsModel {
  const factory RedemptionsModel({
    @Default(0) int id,
    @Default('') String merchant,
    @Default('') String amount,
    @JsonKey(name: 'card_redemption_amount')
    @Default('')
        String redemptionAmount,
    @Default('') String status,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'transaction_type') @Default('') String transactionType,
    @Default(Person()) Person person,
    @JsonKey(name: 'person_info') @Default(Person()) Person personInfo,
    @JsonKey(name: 'card_account')
    @Default(CardAccount())
        CardAccount cardAccount,
  }) = _RedemptionsModel;

  factory RedemptionsModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionsModelFromJson(json);
}
