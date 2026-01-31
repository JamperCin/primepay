// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      accountId: (json['account_id'] as num?)?.toInt() ?? 0,
      cardId: (json['card_id'] as num?)?.toInt() ?? 0,
      accountCurrency: json['account_currency'] as String? ?? "GHS",
      currentBalance: json['current_balance'] as String? ?? "0.0",
      purchaseCode: json['puchase_code'] as String? ?? "",
      accountDiscount: json['account_discount'] as String? ?? "",
      accountStatus: json['account_status'] as String? ?? "",
      purchaseTo: json['purchase_to'] as String? ?? "",
      card: json['card'] == null
          ? const PrimeCardModel()
          : PrimeCardModel.fromJson(json['card'] as Map<String, dynamic>),
      blocked: json['blocked'] as bool? ?? false,
      gifted: json['gifted'] as bool? ?? false,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'card_id': instance.cardId,
      'account_currency': instance.accountCurrency,
      'current_balance': instance.currentBalance,
      'puchase_code': instance.purchaseCode,
      'account_discount': instance.accountDiscount,
      'account_status': instance.accountStatus,
      'purchase_to': instance.purchaseTo,
      'card': instance.card,
      'blocked': instance.blocked,
      'gifted': instance.gifted,
    };
