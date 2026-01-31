// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Revenue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RevenueImpl _$$RevenueImplFromJson(Map<String, dynamic> json) =>
    _$RevenueImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      availableBalance: json['available_balance'] as String? ?? "0.0",
      createdAt: json['created_at'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      ownerId: (json['owner_id'] as num?)?.toInt() ?? 0,
      ownerType: json['owner_type'] as String? ?? "",
      balance: json['balance'] as String? ?? "0.0",
    );

Map<String, dynamic> _$$RevenueImplToJson(_$RevenueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'available_balance': instance.availableBalance,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'owner_id': instance.ownerId,
      'owner_type': instance.ownerType,
      'balance': instance.balance,
    };
