import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/enums/enum_weight_unit.dart';

part 'create_post_state.freezed.dart';

@freezed
class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    required bool isLoading,
    required bool isFirstLoad,
    String? error,
    required List<AddressDataModel> provinces,
    required List<AddressDataModel> selectedProvinces,
    required List<AddressDataModel> selectedProvincesDeliver,
    required String errorProvince,
    required String errorProvinceDeliver,
    required WeightUnitType unit,
    required List<TonnageType> tonnages,
    TextEditingController? phoneController,
    TextEditingController? contentController,
    TextEditingController? amountController,
  }) = _CreatePostState;

  factory CreatePostState.initial() => const CreatePostState(
      isLoading: false,
      isFirstLoad: false,
      error: "",
      provinces: [],
      selectedProvinces: [],
      selectedProvincesDeliver: [],
      errorProvince: '',
      errorProvinceDeliver: '',
      unit: WeightUnitType.ton,
      tonnages: []);
}
