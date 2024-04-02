import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/account/account_model.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_noti_config.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  UpdateInfoCubit() : super(UpdateInfoState.initial());

  Future<void> init(AccountData accountData) async {
    try {
      emit(state.copyWith(isLoading: true, isFirstLoad: true));
      await getZones();
      emit(state.copyWith(
        isLoading: false,
        isFirstLoad: false,
        nameController: TextEditingController(text: accountData.name),
        phoneController: TextEditingController(text: accountData.phone),
        emailController: TextEditingController(text: accountData.email),
        paswordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
      ));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isFirstLoad: false, isLoading: false, error: errorMessage));
    }
  }

  Future<void> getZones() async {
    final response = await mainRepository.getZones();
    emit(state);
  }

  void showPass() {
    emit(state.copyWith(showPass: !state.showPass));
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
