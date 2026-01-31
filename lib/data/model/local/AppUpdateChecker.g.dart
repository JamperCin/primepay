// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppUpdateChecker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUpdateCheckerImpl _$$AppUpdateCheckerImplFromJson(
        Map<String, dynamic> json) =>
    _$AppUpdateCheckerImpl(
      versionCode: (json['versionCode'] as num?)?.toInt() ?? 0,
      feature: json['feature'] as String? ?? "",
      forceUpdate: json['forceUpdate'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppUpdateCheckerImplToJson(
        _$AppUpdateCheckerImpl instance) =>
    <String, dynamic>{
      'versionCode': instance.versionCode,
      'feature': instance.feature,
      'forceUpdate': instance.forceUpdate,
    };
