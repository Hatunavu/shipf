import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/order/order.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_order_type.dart';
import 'package:shipf/enums/enum_payment_type.dart';
import 'package:shipf/enums/enum_source_type.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  Future init({int shipmentId = 0}) async {
    if (shipmentId == 0) {
      emit(state.copyWith(isLoading: true, isFirstLoad: true));
      await getProvinces();
      emit(state.copyWith(
        isLoading: false,
        isFirstLoad: false,
        senderNameController: TextEditingController(),
        senderPhoneController: TextEditingController(),
        senderAddressController: TextEditingController(),
        receiverNameController: TextEditingController(),
        receiverPhoneController: TextEditingController(),
        receiverAddressController: TextEditingController(),
        parcelNameController: TextEditingController(),
        parcelPriceController: TextEditingController(text: '0'),
        parcelAmountController: TextEditingController(text: '1'),
        parcelWeightController: TextEditingController(text: '1'),
        lengthController: TextEditingController(text: '0'),
        widthController: TextEditingController(text: '0'),
        heightController: TextEditingController(text: '0'),
        codController: TextEditingController(text: '0'),
        noteController: TextEditingController(),
      ));
    } else {
      await initUpdate(shipmentId: shipmentId);
    }
  }

  Future initUpdate({int shipmentId = 0}) async {
    emit(state.copyWith(isLoading: true, isFirstLoad: true));
    final response =
        await mainRepository.getShipmentDetail(shipmentId: shipmentId);

    final ShipmentData shipment = response.data!;
    await selectAddress(
        provinceId: shipment.pickupAddress?.provinceId,
        districtId: shipment.pickupAddress?.districtId,
        wardId: shipment.pickupAddress?.wardId);
    await selectAddress(
        provinceId: shipment.deliveryAddress?.provinceId,
        districtId: shipment.deliveryAddress?.districtId,
        wardId: shipment.deliveryAddress?.wardId,
        isDeliver: true);
    emit(state.copyWith(
        isLoading: false,
        isFirstLoad: false,
        senderNameController: TextEditingController(
            text: shipment.pickupAddress?.contactName ?? ''),
        senderPhoneController: TextEditingController(
            text: shipment.pickupAddress?.contactPhone ?? ''),
        senderAddressController:
            TextEditingController(text: shipment.pickupAddress?.address ?? ''),
        receiverNameController: TextEditingController(
            text: shipment.deliveryAddress?.contactName ?? ''),
        receiverPhoneController: TextEditingController(
            text: shipment.deliveryAddress?.contactPhone ?? ''),
        receiverAddressController: TextEditingController(
            text: shipment.deliveryAddress?.address ?? ''),
        parcelNameController: TextEditingController(text: shipment.goodsName),
        parcelPriceController: TextEditingController(
            text: NumberFormat.decimalPattern()
                .format(shipment.declaredValue)
                .toString()),
        parcelAmountController:
            TextEditingController(text: shipment.quantity.toString()),
        parcelWeightController:
            TextEditingController(text: shipment.netWeight.toString()),
        lengthController:
            TextEditingController(text: shipment.length.toString()),
        widthController: TextEditingController(text: shipment.width.toString()),
        heightController:
            TextEditingController(text: shipment.height.toString()),
        codController: TextEditingController(
            text:
                NumberFormat.decimalPattern().format(shipment.cod).toString()),
        noteController: TextEditingController(text: shipment.note),
        insurance: shipment.isInsured,
        pickupPoint: shipment.loadingType == LoadingType.pickup ||
            shipment.loadingType == LoadingType.all,
        deliveryPoint: shipment.loadingType == LoadingType.delivery ||
            shipment.loadingType == LoadingType.all,
        paymentType: shipment.paymentTerm));
  }

  void updateStepOrder(StepOrderType stepOrderType) {
    emit(state.copyWith(stepOrderType: stepOrderType));
  }

  Future<void> selectService(OrderServiceData service) async {
    emit(state.copyWith(isUpdate: true));
    final newList = state.orderServices.map((e) {
      if (e.id == service.id) {
        service.isSelect = true;
        return service;
      } else {
        e.isSelect = false;
        return e;
      }
    }).toList();
    emit(state.copyWith(
        orderServices: newList, isUpdate: false, serviceSelected: service));
  }

  void updateLoadingType({bool isPickup = true}) {
    if (isPickup) {
      emit(state.copyWith(pickupPoint: !state.pickupPoint));
    } else {
      emit(state.copyWith(deliveryPoint: !state.deliveryPoint));
    }
    LoadingType? loadingType;
    if (state.pickupPoint && state.deliveryPoint) {
      loadingType = LoadingType.all;
    } else if (state.pickupPoint && !state.deliveryPoint) {
      loadingType = LoadingType.pickup;
    } else if (!state.pickupPoint && state.deliveryPoint) {
      loadingType = LoadingType.delivery;
    } else {
      loadingType = null;
    }
    emit(state.copyWith(loadingType: loadingType));
  }

  void updatePaymentType(PaymentType paymentType) {
    emit(state.copyWith(paymentType: paymentType));
  }

  void updateInsurance() {
    emit(state.copyWith(insurance: !state.insurance));
  }

  Future<void> getService() async {
    try {
      emit(state.copyWith(isGettingService: true, serviceSelected: null));
      final response = await mainRepository.getOrderService(
          // pickupAddressId: state.addressPick?.id,
          pickupProvinceId: state.province!.id,
          pickupDistrictId: state.district!.id,
          // deliveryAddressId: state.addressDeliver?.id,
          deliveryProvinceId: state.provinceDeliver!.id,
          deliveryDistrictId: state.districtDeliver!.id,
          type: OrderType.express.toJsonString(),
          netWeight: int.parse(state.parcelWeightController!.text),
          quantity: int.parse(state.parcelAmountController!.text),
          length: int.parse(state.lengthController!.text),
          width: int.parse(state.widthController!.text),
          height: int.parse(state.heightController!.text),
          declaredValue:
              int.parse(state.parcelPriceController!.text.replaceAll(',', '')),
          cod: state.codController!.text.isEmpty
              ? null
              : int.parse(state.codController!.text.replaceAll(',', '')),
          isInsured: state.insurance,
          loading: state.loadingType?.toJsonString());

      emit(state.copyWith(
          isGettingService: false, orderServices: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isGettingService: false, error: errorMessage));
    }
  }

  Future<bool> createOrder() async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.createOrder(OrderRequest(
          // pickupAddressId: 339,
          pickupProvinceId: state.province!.id,
          pickupDistrictId: state.district!.id,
          pickupWardId: state.ward!.id,
          pickupAddress: state.senderAddressController!.text,
          pickupName: state.senderNameController!.text,
          pickupPhone: state.senderPhoneController!.text,
          // deliveryAddressId: 248,
          deliveryProvinceId: state.provinceDeliver!.id,
          deliveryDistrictId: state.districtDeliver!.id,
          deliveryWardId: state.wardDeliver!.id,
          deliveryAddress: state.receiverAddressController!.text,
          deliveryName: state.receiverNameController!.text,
          deliveryPhone: state.receiverPhoneController!.text,
          priceListId: state.serviceSelected?.id ?? 0,
          goodsName: state.parcelNameController!.text,
          netWeight: int.parse(state.parcelWeightController!.text),
          quantity: int.parse(state.parcelAmountController!.text),
          length: int.parse(state.lengthController!.text),
          width: int.parse(state.widthController!.text),
          height: int.parse(state.heightController!.text),
          declaredValue:
              int.parse(state.parcelPriceController!.text.replaceAll(',', '')),
          source: SourceType.form,
          paymentTerm: state.paymentType,
          isInsured: state.insurance,
          loading: state.loadingType?.toJsonString(),
          cod: int.parse(state.codController!.text.replaceAll(',', '')),
          note: state.noteController?.text));
      emit(state.copyWith(isLoading: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }

  Future<void> selectAddress(
      {AddressSavedData? address,
      int? provinceId,
      int? districtId,
      int? wardId,
      bool isDeliver = false}) async {
    address != null ? emit(state.copyWith(isLoading: true)) : null;
    //update province
    final provinces = await mainRepository.getProvinces();
    final provincesData = address != null ? state.provinces : provinces.data;
    final indexProvince = provincesData.indexWhere(
        (element) => element.id == (address?.provinceId ?? provinceId));
    //update district
    final districts = await mainRepository
        .getDistricts(address?.provinceId ?? provinceId ?? 0);
    final indexDistrict = districts.data.indexWhere(
        (element) => element.id == (address?.districtId ?? districtId));
    //update ward
    final wards =
        await mainRepository.getWards(address?.districtId ?? districtId ?? 0);
    final indexWard = wards.data
        .indexWhere((element) => element.id == (address?.wardId ?? wardId));
    isDeliver
        ? emit(state.copyWith(
            addressPick: address,
            isLoading: false,
            provinceDeliver: provincesData[indexProvince],
            districtsDeliver: districts.data,
            districtDeliver: districts.data[indexDistrict],
            wardsDeliver: wards.data,
            wardDeliver: wards.data[indexWard],
            errorProvinceDeliver: '',
            errorDistrictDeliver: '',
            errorWardDeliver: '',
            provinces: provincesData))
        : emit(state.copyWith(
            addressPick: address,
            isLoading: false,
            province: provincesData[indexProvince],
            districts: districts.data,
            district: districts.data[indexDistrict],
            wards: wards.data,
            ward: wards.data[indexWard],
            errorProvince: '',
            errorDistrict: '',
            errorWard: ''));
  }

  //location
  Future<void> getProvinces() async {
    final response = await mainRepository.getProvinces();
    emit(state.copyWith(
      provinces: response.data,
    ));
  }

  Future<List<AddressDataModel>> getDistricts({
    required int provinceId,
  }) async {
    emit(state.copyWith(isLoading: true));
    final response = await mainRepository.getDistricts(provinceId);
    emit(state.copyWith(
        isLoading: false,
        districts: response.data,
        district: null,
        ward: null,
        wards: []));
    return response.data;
  }

  Future<List<AddressDataModel>> getWards({required int districtId}) async {
    emit(state.copyWith(isLoading: true, isLoadingWard: true));
    final response = await mainRepository.getWards(districtId);
    emit(state.copyWith(
        isLoading: false,
        wards: response.data,
        isLoadingWard: false,
        ward: null));
    return response.data;
  }

  Future<void> updateProvince(AddressDataModel province) async {
    emit(state.copyWith(province: province, errorProvince: ''));
  }

  Future<void> updateDistrict(AddressDataModel district) async {
    emit(state.copyWith(district: district, errorDistrict: ''));
  }

  Future<void> updateWard(AddressDataModel ward) async {
    emit(state.copyWith(ward: ward, errorWard: ''));
  }

  Future<void> updateProvinceError() async {
    emit(state.copyWith(errorProvince: 'Vui lòng chọn Tỉnh/Thành phố'));
  }

  Future<void> updateDistrictError() async {
    emit(state.copyWith(errorDistrict: 'Vui lòng chọn Quận/Huyện'));
  }

  Future<void> updateWardError() async {
    emit(state.copyWith(errorWard: 'Vui lòng chọn Phường/Xã/Thị trấn'));
  }

  //deliver

  Future<List<AddressDataModel>> getDistrictsDeliver({
    required int provinceId,
  }) async {
    emit(state.copyWith(isLoading: true, isLoadingDistrict: true));
    final response = await mainRepository.getDistricts(provinceId);
    emit(state.copyWith(
        isLoading: false,
        districtsDeliver: response.data,
        isLoadingDistrict: false,
        districtDeliver: null,
        wardDeliver: null,
        wardsDeliver: []));
    return response.data;
  }

  Future<List<AddressDataModel>> getWardsDeliver(
      {required int districtId}) async {
    emit(state.copyWith(isLoading: true));
    final response = await mainRepository.getWards(districtId);
    emit(state.copyWith(
        isLoading: false,
        wardsDeliver: response.data,
        isLoadingWard: false,
        wardDeliver: null));
    return response.data;
  }

  Future<void> updateProvinceDeliver(AddressDataModel province) async {
    emit(state.copyWith(provinceDeliver: province, errorProvinceDeliver: ''));
  }

  Future<void> updateDistrictDeliver(AddressDataModel district) async {
    emit(state.copyWith(districtDeliver: district, errorDistrictDeliver: ''));
  }

  Future<void> updateWardDeliver(AddressDataModel ward) async {
    emit(state.copyWith(wardDeliver: ward, errorWardDeliver: ''));
  }

  Future<void> updateProvinceDeliverError() async {
    emit(state.copyWith(errorProvinceDeliver: 'Vui lòng chọn Tỉnh/Thành phố'));
  }

  Future<void> updateDistrictDeliverError() async {
    emit(state.copyWith(errorDistrictDeliver: 'Vui lòng chọn Quận/Huyện'));
  }

  Future<void> updateWardDeliverError() async {
    emit(state.copyWith(errorWardDeliver: 'Vui lòng chọn Phường/Xã/Thị trấn'));
  }
}
