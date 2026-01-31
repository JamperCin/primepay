// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppBaseResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppBaseResponseImpl _$$AppBaseResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AppBaseResponseImpl(
      success: json['success'] as bool? ?? false,
      status: (json['status'] as num?)?.toInt() ?? 0,
      error: json['error_msg'] as String? ?? '',
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppBaseResponseImplToJson(
        _$AppBaseResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'error_msg': instance.error,
      'data': instance.data,
    };
