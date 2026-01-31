// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemptions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RedemptionsModelImpl _$$RedemptionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RedemptionsModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      merchant: json['merchant'] as String? ?? '',
      amount: json['amount'] as String? ?? '',
      redemptionAmount: json['card_redemption_amount'] as String? ?? '',
      status: json['status'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      transactionType: json['transaction_type'] as String? ?? '',
      person: json['person'] == null
          ? const Person()
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      personInfo: json['person_info'] == null
          ? const Person()
          : Person.fromJson(json['person_info'] as Map<String, dynamic>),
      cardAccount: json['card_account'] == null
          ? const CardAccount()
          : CardAccount.fromJson(json['card_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RedemptionsModelImplToJson(
        _$RedemptionsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'merchant': instance.merchant,
      'amount': instance.amount,
      'card_redemption_amount': instance.redemptionAmount,
      'status': instance.status,
      'created_at': instance.createdAt,
      'transaction_type': instance.transactionType,
      'person': instance.person,
      'person_info': instance.personInfo,
      'card_account': instance.cardAccount,
    };
