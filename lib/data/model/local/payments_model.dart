import 'package:freezed_annotation/freezed_annotation.dart';

part 'payments_model.freezed.dart';
part 'payments_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    @JsonKey(name: 'transaction_type') @Default('') String transactionType,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'disbursement_amount') @Default('') String amount,
    @JsonKey(name: 'payment_to') @Default('') String paymentTo,
    @Default('') String status,
    @Default('') String reference,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
