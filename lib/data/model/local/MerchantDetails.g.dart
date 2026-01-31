// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MerchantDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchantDetailsImpl _$$MerchantDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$MerchantDetailsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      parentId: (json['parent_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      telephone: json['telephone'] as String? ?? '',
      description: json['description'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      email: json['email'] as String? ?? '',
      code: json['code'] as String? ?? '',
      address: json['address'] as String? ?? '',
      status: json['status'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      duplicated: json['duplicated'] as bool? ?? false,
      registrationNumber: json['business_registration_number'] as String? ?? '',
      tinNumber: json['tin_number'] as String? ?? '',
      websiteUrl: json['website_url'] as String? ?? '',
      headOffice: json['head_office'] as bool? ?? false,
      logoUrl: json['logo_url'] as String? ?? '',
      minPrice: (json['min_card_price'] as num?)?.toDouble() ?? 0,
      maxPrice: (json['max_card_price'] as num?)?.toDouble() ?? 0,
      coordinates: json['cordinates'] == null
          ? null
          : Coordinates.fromJson(json['cordinates'] as Map<String, dynamic>),
      revenue: json['revenue'] == null
          ? null
          : Revenue.fromJson(json['revenue'] as Map<String, dynamic>),
      bankAccount: json['bank_account'] == null
          ? null
          : BankAccount.fromJson(json['bank_account'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? "",
      clientType: json['client_type'] as String? ?? "",
      createdBy: json['created_by'] == null
          ? null
          : Person.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MerchantDetailsImplToJson(
        _$MerchantDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'location': instance.location,
      'telephone': instance.telephone,
      'description': instance.description,
      'branch': instance.branch,
      'email': instance.email,
      'code': instance.code,
      'address': instance.address,
      'status': instance.status,
      'verified': instance.verified,
      'duplicated': instance.duplicated,
      'business_registration_number': instance.registrationNumber,
      'tin_number': instance.tinNumber,
      'website_url': instance.websiteUrl,
      'head_office': instance.headOffice,
      'logo_url': instance.logoUrl,
      'min_card_price': instance.minPrice,
      'max_card_price': instance.maxPrice,
      'cordinates': instance.coordinates,
      'revenue': instance.revenue,
      'bank_account': instance.bankAccount,
      'created_at': instance.createdAt,
      'client_type': instance.clientType,
      'created_by': instance.createdBy,
    };
