// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppUpdateMeta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUpdateMetaImpl _$$AppUpdateMetaImplFromJson(Map<String, dynamic> json) =>
    _$AppUpdateMetaImpl(
      ios: json['ios'] == null
          ? const AppUpdateChecker()
          : AppUpdateChecker.fromJson(json['ios'] as Map<String, dynamic>),
      android: json['android'] == null
          ? const AppUpdateChecker()
          : AppUpdateChecker.fromJson(json['android'] as Map<String, dynamic>),
      primePayAndroid: json['prime_pay_android'] == null
          ? const AppUpdateChecker()
          : AppUpdateChecker.fromJson(
              json['prime_pay_android'] as Map<String, dynamic>),
      primePayIos: json['prime_pay_ios'] == null
          ? const AppUpdateChecker()
          : AppUpdateChecker.fromJson(
              json['prime_pay_ios'] as Map<String, dynamic>),
      primePayPos: json['prime_pay_pos'] == null
          ? const AppUpdateChecker()
          : AppUpdateChecker.fromJson(
              json['prime_pay_pos'] as Map<String, dynamic>),
      primePayPosReceiptContact:
          json['prime_pay_pos_receipt_contact'] as String? ?? '',
    );

Map<String, dynamic> _$$AppUpdateMetaImplToJson(_$AppUpdateMetaImpl instance) =>
    <String, dynamic>{
      'ios': instance.ios,
      'android': instance.android,
      'prime_pay_android': instance.primePayAndroid,
      'prime_pay_ios': instance.primePayIos,
      'prime_pay_pos': instance.primePayPos,
      'prime_pay_pos_receipt_contact': instance.primePayPosReceiptContact,
    };
