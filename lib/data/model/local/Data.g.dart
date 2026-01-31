// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      signupUser: json['signup_user'] == null
          ? const Customer()
          : Customer.fromJson(json['signup_user'] as Map<String, dynamic>),
      verifiedToken: json['verified_token'] == null
          ? const VerifiedToken()
          : VerifiedToken.fromJson(
              json['verified_token'] as Map<String, dynamic>),
      merchant: json['merchant'] == null
          ? const MerchantDetails()
          : MerchantDetails.fromJson(json['merchant'] as Map<String, dynamic>),
      token: json['token'] as String? ?? '',
      paymentUrl: json['payment_url'] as String? ?? '',
      userDetails: json['user_details'] == null
          ? const Customer()
          : Customer.fromJson(json['user_details'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? const AppUpdateMeta()
          : AppUpdateMeta.fromJson(json['meta'] as Map<String, dynamic>),
      account: json['account'] == null
          ? const Account()
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      redemptions: (json['redemptions'] as List<dynamic>?)
              ?.map((e) => RedemptionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RedemptionsModel>[],
      disbursements: (json['disbursements'] as List<dynamic>?)
              ?.map(
                  (e) => DisbursementModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DisbursementModel>[],
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'signup_user': instance.signupUser,
      'verified_token': instance.verifiedToken,
      'merchant': instance.merchant,
      'token': instance.token,
      'payment_url': instance.paymentUrl,
      'user_details': instance.userDetails,
      'meta': instance.meta,
      'account': instance.account,
      'redemptions': instance.redemptions,
      'disbursements': instance.disbursements,
    };
