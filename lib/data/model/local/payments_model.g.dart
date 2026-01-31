// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      transactionType: json['transaction_type'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      amount: json['disbursement_amount'] as String? ?? '',
      paymentTo: json['payment_to'] as String? ?? '',
      status: json['status'] as String? ?? '',
      reference: json['reference'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'transaction_type': instance.transactionType,
      'created_at': instance.createdAt,
      'disbursement_amount': instance.amount,
      'payment_to': instance.paymentTo,
      'status': instance.status,
      'reference': instance.reference,
    };
