import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/account/account_model.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_noti_config.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/enums/enum_zone_type.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_state.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  UpdateInfoCubit() : super(UpdateInfoState.initial());

  Future<void> init(AccountData accountData,
      {RoleType roleType = RoleType.customer}) async {
    try {
      emit(state.copyWith(isLoading: true, isFirstLoad: true));
      roleType == RoleType.shipper ? await getZones() : null;
      emit(state.copyWith(
          isLoading: false,
          isFirstLoad: false,
          nameController: TextEditingController(text: accountData.name),
          phoneController: TextEditingController(text: accountData.phone),
          emailController: TextEditingController(text: accountData.email),
          passwordController: TextEditingController(),
          confirmPasswordController: TextEditingController(),
          selectedZones: accountData.zones
              .where((e) => e.type == ZoneType.pickupZone)
              .toList(),
          selectedZonesDeliver: accountData.zones
              .where((e) => e.type == ZoneType.deliveryZone)
              .toList()));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isFirstLoad: false, isLoading: false, error: errorMessage));
    }
  }

  Future<void> getZones() async {
    final zoneResponse =
        await mainRepository.getZones(type: ZoneType.pickupZone.toJsonString());
    final zoneDeliveryResponse = await mainRepository.getZones(
        type: ZoneType.deliveryZone.toJsonString());

    emit(state.copyWith(
        zones: zoneResponse.data, zonesDelivery: zoneDeliveryResponse.data));
  }

  void showPass() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  Future<void> updateZone(List<AccountZone> zones,
      {bool isDelivery = false}) async {
    if (isDelivery) {
      zones.isEmpty
          ? emit(state.copyWith(selectedZonesDeliver: zones))
          : emit(state.copyWith(
              selectedZonesDeliver: zones, errorZoneDeliver: ''));
    } else {
      zones.isEmpty
          ? emit(state.copyWith(selectedZones: zones))
          : emit(state.copyWith(selectedZones: zones, errorZone: ''));
    }
  }

  Future<void> updateZoneError({bool isDelivery = false}) async {
    if (isDelivery) {
      emit(state.copyWith(errorZoneDeliver: 'Vui lòng chọn Khu vực trả hàng'));
    } else {
      emit(state.copyWith(errorZone: 'Vui lòng chọn Khu vực bốc hàng'));
    }
  }

  Future<void> updateInfo() async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.updateProfile(
          request: AccountRequest(
              name: state.nameController!.text,
              phone: state.phoneController!.text,
              email: state.emailController!.text.isEmpty
                  ? null
                  : state.emailController!.text,
              password: state.passwordController!.text,
              zoneIds: [
            ...state.selectedZones.map((e) => e.id.toString()).toList(),
            ...state.selectedZonesDeliver.map((e) => e.id.toString()).toList()
          ]));
      ToastUtils.showSuccess('Cập nhật thông tin thành công');
      emit(state.copyWith(
        isLoading: false,
      ));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> updateProvince(List<AddressDataModel> provinces,
      {bool isDelivery = false}) async {
    if (isDelivery) {
      emit(state.copyWith(
          selectedProvincesDeliver: provinces, errorProvinceDeliver: ''));
    } else {
      emit(state.copyWith(selectedProvinces: provinces, errorProvince: ''));
    }
  }

  Future<void> updateProvinceError({bool isDelivery = false}) async {
    if (isDelivery) {
      emit(
          state.copyWith(errorProvinceDeliver: 'Vui lòng chọn Tỉnh/Thành phố'));
    } else {
      emit(state.copyWith(errorProvince: 'Vui lòng chọn Tỉnh/Thành phố'));
    }
  }

  Future<void> updateTonnage(TonnageType tonnage) async {
    // List<String> newList = tonnages.map((e) => e.toJsonString()).toList();
    // newList.sort((a, b) => a.compareTo(b));
    // List<TonnageType> newTonnages =
    //     newList.map((e) => stringToTonnageType(e)).toList();
    emit(state.copyWith(tonnage: tonnage));
  }

  Future<void> updateNotiConfig(NotiConfig? notiConfig) async {
    emit(state.copyWith(notiConfig: notiConfig));
  }
}
