// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseModel _$AddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddressResponseModel(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseModelToJson(
        AddressResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

AddressDataResponse _$AddressDataResponseFromJson(Map<String, dynamic> json) =>
    AddressDataResponse(
      id: json['_id'] as String,
      codes: AddressCode.fromJson(json['codes'] as Map<String, dynamic>),
      location:
          AddressLocation.fromJson(json['location'] as Map<String, dynamic>),
      details: json['details'] as String,
      fullAddress: json['fullAddress'] as String,
      fullName: json['fullName'] as String,
      isDefault: json['isDefault'] as bool,
      isDeleted: json['isDeleted'] as bool,
      owner: json['owner'] as String?,
      phone: json['phone'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AddressDataResponseToJson(
        AddressDataResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'codes': instance.codes,
      'location': instance.location,
      'owner': instance.owner,
      'phone': instance.phone,
      'fullName': instance.fullName,
      'details': instance.details,
      'isDeleted': instance.isDeleted,
      'isDefault': instance.isDefault,
      'fullAddress': instance.fullAddress,
      'type': instance.type,
    };

AddressCode _$AddressCodeFromJson(Map<String, dynamic> json) => AddressCode(
      district: json['district'] as String,
      province: json['province'] as String,
      ward: json['ward'] as String,
    );

Map<String, dynamic> _$AddressCodeToJson(AddressCode instance) =>
    <String, dynamic>{
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
    };

AddressLocation _$AddressLocationFromJson(Map<String, dynamic> json) =>
    AddressLocation(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$AddressLocationToJson(AddressLocation instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };

AddressRequest _$AddressRequestFromJson(Map<String, dynamic> json) =>
    AddressRequest(
      detailAddress: json['detailAddress'] as String,
      districtCode: json['districtCode'] as String,
      fullAddress: json['fullAddress'] as String,
      fullName: json['fullName'] as String,
      isDefault: json['isDefault'] as bool? ?? false,
      phone: json['phone'] as String,
      provinceCode: json['provinceCode'] as String,
      wardCode: json['wardCode'] as String,
    );

Map<String, dynamic> _$AddressRequestToJson(AddressRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'provinceCode': instance.provinceCode,
      'districtCode': instance.districtCode,
      'wardCode': instance.wardCode,
      'detailAddress': instance.detailAddress,
      'fullAddress': instance.fullAddress,
      'isDefault': instance.isDefault,
    };

AddressResponseRequest _$AddressResponseRequestFromJson(
        Map<String, dynamic> json) =>
    AddressResponseRequest(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : AddressDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressResponseRequestToJson(
        AddressResponseRequest instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

AddressResponseDelete _$AddressResponseDeleteFromJson(
        Map<String, dynamic> json) =>
    AddressResponseDelete(
      status: json['status'] as int,
      message: json['message'] as String,
      error: json['error'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$AddressResponseDeleteToJson(
        AddressResponseDelete instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };
