import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/post/post_request.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/enums/enum_weight_unit.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/cubit/create_post_state.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostState.initial());

  Future init({PostData? postData}) async {
    try {
      emit(state.copyWith(isLoading: true, isFirstLoad: true));
      await getProvinces();
      emit(state.copyWith(
          isLoading: false,
          isFirstLoad: false,
          phoneController: TextEditingController(text: postData?.contactPhone),
          contentController: TextEditingController(text: postData?.content),
          amountController: TextEditingController(
              text: NumberFormat.decimalPattern().format(int.parse(
                  postData?.weight.toString().replaceAll(',', '') == null
                      ? '1'
                      : postData!.weight.toString().replaceAll(',', '')))),
          unit: postData?.weightUnit ?? WeightUnitType.ton,
          selectedProvinces: postData?.pickupProvinces ?? [],
          selectedProvincesDeliver: postData?.deliveryProvinces ?? [],
          tonnage: postData?.tonnage == null
              ? null
              : stringToTonnageType(postData!.tonnage)));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isLoading: false, isFirstLoad: false, error: errorMessage));
    }
  }

  Future<void> getProvinces() async {
    final response = await mainRepository.getProvinces();
    emit(state.copyWith(
      provinces: response.data,
    ));
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

  Future<void> updateUnit(WeightUnitType unit) async {
    emit(state.copyWith(unit: unit));
  }

  Future<void> updateTonnage(TonnageType tonnage) async {
    // List<String> newList = tonnages.map((e) => e.toJsonString()).toList();
    // newList.sort((a, b) => a.compareTo(b));
    // List<TonnageType> newTonnages =
    //     newList.map((e) => stringToTonnageType(e)).toList();
    emit(state.copyWith(tonnage: tonnage, errorTonnage: ''));
  }

  Future<void> updateTonnageError() async {
    emit(state.copyWith(errorTonnage: 'Vui lòng chọn loại xe'));
  }

  Future<void> createPost({PostStatusType status = PostStatusType.neww}) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.createPost(
          postRequest: PostRequest(
              contactPhone: state.phoneController!.text,
              content: state.contentController!.text,
              weight:
                  int.parse(state.amountController!.text.replaceAll(',', '')),
              weightUnit: state.unit,
              pickupProvinceIds:
                  state.selectedProvinces.map((e) => e.id).toList(),
              deliveryProvinceIds:
                  state.selectedProvincesDeliver.map((e) => e.id).toList(),
              tonnage: state.tonnage!.toJsonString(),
              status: status));
      status == PostStatusType.draft
          ? ToastUtils.showSuccess('Lưu nháp thành công')
          : ToastUtils.showSuccess('Đăng đơn thành công');

      emit(state.copyWith(
        isLoading: false,
      ));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isFirstLoad: false, isLoading: false, error: errorMessage));
    }
  }

  Future<void> updatePost(
      {required int id, PostStatusType status = PostStatusType.neww}) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.updatePost(
          id: id,
          postRequest: PostRequest(
              contactPhone: state.phoneController!.text,
              content: state.contentController!.text,
              weight:
                  int.parse(state.amountController!.text.replaceAll(',', '')),
              weightUnit: state.unit,
              pickupProvinceIds:
                  state.selectedProvinces.map((e) => e.id).toList(),
              deliveryProvinceIds:
                  state.selectedProvincesDeliver.map((e) => e.id).toList(),
              tonnage: state.tonnage!.toJsonString(),
              status: status));
      status == PostStatusType.draft
          ? ToastUtils.showSuccess('Lưu nháp thành công')
          : ToastUtils.showSuccess('Đăng đơn thành công');

      emit(state.copyWith(
          isLoading: false,
          phoneController: TextEditingController(),
          contentController: TextEditingController(),
          amountController: TextEditingController(text: '1'),
          tonnage: null,
          selectedProvinces: [],
          selectedProvincesDeliver: []));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isFirstLoad: false, isLoading: false, error: errorMessage));
    }
  }
}
