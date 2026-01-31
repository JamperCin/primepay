import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/Account.dart';
import 'package:prime_pay/data/model/local/AppUpdateMeta.dart';
import 'package:prime_pay/data/model/local/Customer.dart';
import 'package:prime_pay/data/model/local/MerchantDetails.dart';
import 'package:prime_pay/data/model/local/VerifiedToken.dart';
import 'package:prime_pay/data/model/local/disbursement_model.dart';
import 'package:prime_pay/data/model/local/redemptions_model.dart';

part 'Data.freezed.dart';
part 'Data.g.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]


@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'signup_user') @Default(Customer()) Customer signupUser,
    @JsonKey(name: 'verified_token')
    @Default(VerifiedToken())
        VerifiedToken verifiedToken,
    @Default(MerchantDetails()) MerchantDetails merchant,
    @Default('') String token,
    @JsonKey(name: 'payment_url')@Default('') String paymentUrl,
    @JsonKey(name: 'user_details') @Default(Customer()) Customer userDetails,
    @Default(AppUpdateMeta()) AppUpdateMeta meta,
    @Default(Account()) Account account,
    @Default(<RedemptionsModel>[]) List<RedemptionsModel> redemptions,
    @Default(<DisbursementModel>[]) List<DisbursementModel> disbursements,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
