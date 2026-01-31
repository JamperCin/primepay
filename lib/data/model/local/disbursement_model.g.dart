// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disbursement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisbursementModelImpl _$$DisbursementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DisbursementModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      state: json['state'] as String? ?? '',
      merchantName: json['client_name'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      payments: (json['payments'] as List<dynamic>?)
              ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PaymentModel>[],
      redemption: json['related_transaction'] == null
          ? const RedemptionsModel()
          : RedemptionsModel.fromJson(
              json['related_transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DisbursementModelImplToJson(
        _$DisbursementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'client_name': instance.merchantName,
      'created_at': instance.createdAt,
      'payments': instance.payments,
      'related_transaction': instance.redemption,
    };
