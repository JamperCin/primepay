import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/payments_model.dart';
import 'package:prime_pay/data/model/local/redemptions_model.dart';

part 'disbursement_model.freezed.dart';
part 'disbursement_model.g.dart';

@freezed
class DisbursementModel with _$DisbursementModel {
  const factory DisbursementModel({
    @Default(0) int id,
    @Default('') String state,
    @JsonKey(name: 'client_name') @Default('') String merchantName,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default(<PaymentModel>[]) List<PaymentModel> payments,
    @JsonKey(name: 'related_transaction')
    @Default(RedemptionsModel())
        RedemptionsModel redemption,
  }) = _DisbursementModel;

  factory DisbursementModel.fromJson(Map<String, dynamic> json) =>
      _$DisbursementModelFromJson(json);
}
