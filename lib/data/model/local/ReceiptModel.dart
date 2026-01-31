import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReceiptModel.freezed.dart';
part 'ReceiptModel.g.dart';

@freezed
class ReceiptModel with _$ReceiptModel {
  const factory ReceiptModel({
    @Default('') String merchantName,
    String? merchantLocation,
    String? disbursedAmount,
    String? redeemedAmount,
    String? attendant,
    String? reference,
    String? receiptNo,
    @Default('') String currency,
    @Default('') String date,
    @Default('') String time,
    String? salutation,
  }) = _ReceiptModel;

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
}
