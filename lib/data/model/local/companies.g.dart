// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompaniesImpl _$$CompaniesImplFromJson(Map<String, dynamic> json) =>
    _$CompaniesImpl(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      telephone: json['telephone'] as String? ?? '',
      code: json['code'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      isHeadOffice: json['head_office'] as bool? ?? false,
      revenue: json['revenue'] == null
          ? null
          : Revenue.fromJson(json['revenue'] as Map<String, dynamic>),
      bankAccount: json['bank_account'] == null
          ? null
          : BankAccount.fromJson(json['bank_account'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? "",
      clientType: json['client_type'] as String? ?? "",
    );

Map<String, dynamic> _$$CompaniesImplToJson(_$CompaniesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'telephone': instance.telephone,
      'code': instance.code,
      'description': instance.description,
      'address': instance.address,
      'id': instance.id,
      'head_office': instance.isHeadOffice,
      'revenue': instance.revenue,
      'bank_account': instance.bankAccount,
      'created_at': instance.createdAt,
      'client_type': instance.clientType,
    };
