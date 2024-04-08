import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/account/account_model.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/enums/enum_noti_config.dart';
import 'package:shipf/enums/enum_tonnage.dart';

part 'update_info_state.freezed.dart';

@freezed
class UpdateInfoState with _$UpdateInfoState {
  const factory UpdateInfoState({
    required bool isLoading,
    required bool isFirstLoad,
    required String error,
    TextEditingController? nameController,
    TextEditingController? phoneController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    required bool showPass,
    required List<AccountZone> zones,
    required List<AccountZone> zonesDelivery,
    required List<AccountZone> selectedZones,
    required List<AccountZone> selectedZonesDeliver,
    required String errorZone,
    required String errorZoneDeliver,
    required List<AddressDataModel> provinces,
    required List<AddressDataModel> selectedProvinces,
    required List<AddressDataModel> selectedProvincesDeliver,
    required String errorProvince,
    required String errorProvinceDeliver,
    TonnageType? tonnage,
    NotiConfig? notiConfig,
  }) = _UpdateInfoState;

  factory UpdateInfoState.initial() => const UpdateInfoState(
        isLoading: false,
        isFirstLoad: true,
        error: "",
        showPass: false,
        zones: [],
        zonesDelivery: [],
        selectedZones: [],
        selectedZonesDeliver: [],
        errorZone: '',
        errorZoneDeliver: '',
        provinces: [],
        selectedProvinces: [],
        selectedProvincesDeliver: [],
        errorProvince: '',
        errorProvinceDeliver: '',
      );
}
