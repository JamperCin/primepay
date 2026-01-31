import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prime_pay/data/model/local/AppUpdateChecker.dart';

part 'AppUpdateMeta.freezed.dart';
part 'AppUpdateMeta.g.dart';

@freezed
class AppUpdateMeta with _$AppUpdateMeta {
  const factory AppUpdateMeta({
    @Default(AppUpdateChecker()) AppUpdateChecker ios,
    @Default(AppUpdateChecker()) AppUpdateChecker android,
    @JsonKey(name: 'prime_pay_android')
    @Default(AppUpdateChecker())
    AppUpdateChecker primePayAndroid,
    @JsonKey(name: 'prime_pay_ios')
    @Default(AppUpdateChecker())
    AppUpdateChecker primePayIos,
    @JsonKey(name: 'prime_pay_pos')
    @Default(AppUpdateChecker())
    AppUpdateChecker primePayPos,
    @JsonKey(name: 'prime_pay_pos_receipt_contact')
    @Default('')
    String primePayPosReceiptContact,
  }) = _AppUpdateMeta;

  factory AppUpdateMeta.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateMetaFromJson(json);
}
