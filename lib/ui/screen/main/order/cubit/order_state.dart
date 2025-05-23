import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_payment_type.dart';
import 'package:shipf/enums/enum_step_order.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required bool isFirstLoad,
    required bool isLoading,
    required bool isUpdate,
    required bool isGettingService,
    String? error,
    OrderServiceData? serviceSelected,
    required StepOrderType stepOrderType,
    required bool pickupPoint,
    required bool deliveryPoint,
    required bool insurance,
    AddressSavedData? addressPick,
    AddressSavedData? addressDeliver,
    required List<OrderServiceData> orderServices,
    LoadingType? loadingType,
    required PaymentType paymentType,
    //location
    required String errorProvince,
    required String errorDistrict,
    required String errorWard,
    bool? isLoadingDistrict,
    bool? isLoadingWard,
    required List<AddressDataModel> provinces,
    required List<AddressDataModel> districts,
    required List<AddressDataModel> wards,
    AddressDataModel? province,
    AddressDataModel? district,
    AddressDataModel? ward,
    required String errorProvinceDeliver,
    required String errorDistrictDeliver,
    required String errorWardDeliver,
    bool? isLoadingDistrictDeliver,
    bool? isLoadingWardDeliver,
    required List<AddressDataModel> districtsDeliver,
    required List<AddressDataModel> wardsDeliver,
    AddressDataModel? provinceDeliver,
    AddressDataModel? districtDeliver,
    AddressDataModel? wardDeliver,
    ShipmentData? shipment,
    //textfield
    TextEditingController? senderNameController,
    TextEditingController? senderPhoneController,
    TextEditingController? senderAddressController,
    TextEditingController? receiverNameController,
    TextEditingController? receiverPhoneController,
    TextEditingController? receiverAddressController,
    TextEditingController? parcelNameController,
    TextEditingController? parcelPriceController,
    TextEditingController? parcelAmountController,
    TextEditingController? parcelWeightController,
    TextEditingController? lengthController,
    TextEditingController? widthController,
    TextEditingController? heightController,
    TextEditingController? codController,
    TextEditingController? noteController,
  }) = _OrderState;

  factory OrderState.initial() => const OrderState(
      isFirstLoad: false,
      isLoading: false,
      error: "",
      stepOrderType: StepOrderType.address,
      isUpdate: false,
      pickupPoint: false,
      deliveryPoint: false,
      insurance: false,
      errorDistrict: '',
      errorProvince: '',
      errorWard: '',
      errorDistrictDeliver: '',
      errorProvinceDeliver: '',
      errorWardDeliver: '',
      provinces: [],
      districts: [],
      wards: [],
      districtsDeliver: [],
      wardsDeliver: [],
      orderServices: [],
      isGettingService: false,
      paymentType: PaymentType.freightPrepaid);
}
