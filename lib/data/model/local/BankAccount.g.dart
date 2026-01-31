// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankAccount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountImpl _$$BankAccountImplFromJson(Map<String, dynamic> json) =>
    _$BankAccountImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      bank: json['bank'] as String? ?? "",
      name: json['name'] as String? ?? "",
      number: json['number'] as String? ?? "",
      createdAt: json['created_at'] as String? ?? "",
      accountType: json['account_type'] as String? ?? "",
    );

Map<String, dynamic> _$$BankAccountImplToJson(_$BankAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank': instance.bank,
      'name': instance.name,
      'number': instance.number,
      'created_at': instance.createdAt,
      'account_type': instance.accountType,
    };
