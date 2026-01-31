// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReceiptModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptModelImpl _$$ReceiptModelImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptModelImpl(
      merchantName: json['merchantName'] as String? ?? '',
      merchantLocation: json['merchantLocation'] as String?,
      disbursedAmount: json['disbursedAmount'] as String?,
      redeemedAmount: json['redeemedAmount'] as String?,
      attendant: json['attendant'] as String?,
      reference: json['reference'] as String?,
      receiptNo: json['receiptNo'] as String?,
      currency: json['currency'] as String? ?? '',
      date: json['date'] as String? ?? '',
      time: json['time'] as String? ?? '',
      salutation: json['salutation'] as String?,
    );

Map<String, dynamic> _$$ReceiptModelImplToJson(_$ReceiptModelImpl instance) =>
    <String, dynamic>{
      'merchantName': instance.merchantName,
      'merchantLocation': instance.merchantLocation,
      'disbursedAmount': instance.disbursedAmount,
      'redeemedAmount': instance.redeemedAmount,
      'attendant': instance.attendant,
      'reference': instance.reference,
      'receiptNo': instance.receiptNo,
      'currency': instance.currency,
      'date': instance.date,
      'time': instance.time,
      'salutation': instance.salutation,
    };
