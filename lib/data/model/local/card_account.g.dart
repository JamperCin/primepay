// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardAccountImpl _$$CardAccountImplFromJson(Map<String, dynamic> json) =>
    _$CardAccountImpl(
      cardOwner: json['card_owner'] == null
          ? const Customer()
          : Customer.fromJson(json['card_owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CardAccountImplToJson(_$CardAccountImpl instance) =>
    <String, dynamic>{
      'card_owner': instance.cardOwner,
    };
