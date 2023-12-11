import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/address/address_model.dart';
import 'package:shipf/data/model/order/order_request.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  Future init() async {
    List<OrderService> listService = [
      OrderService(
          id: 1,
          name: 'TV HN - Vùng 1 20kg',
          type: 'Giao ghép hàng',
          fee: '70.000đ'),
      OrderService(
          id: 2,
          name: 'TV HN - Vùng 1',
          type: 'Giao nguyên chuyến',
          fee: '1.000.000đ'),
      OrderService(
          id: 3,
          name: 'TV HN - Vùng 1 50kg',
          type: 'Giao ghép hàng',
          fee: '160.000đ'),
      OrderService(
          id: 4,
          name: 'NVX Hà Nội - Miền Bắc 1',
          type: 'Giao nguyên chuyến',
          fee: '230.000đ'),
    ];
    listService.first.isSelect = true;
    emit(state.copyWith(
        services: listService, serviceSelected: listService.first));
  }

  void updateStepOrder(StepOrderType stepOrderType) {
    emit(state.copyWith(stepOrderType: stepOrderType));
  }

  Future<void> selectService(OrderService service) async {
    emit(state.copyWith(isUpdate: true));
    final newList = state.services.map((e) {
      if (e.id == service.id) {
        service.isSelect = true;
        return service;
      } else {
        e.isSelect = false;
        return e;
      }
    }).toList();
    emit(state.copyWith(
        services: newList, isUpdate: false, serviceSelected: service));
  }

  void updateDeliveryPoint() {
    emit(state.copyWith(deliveryPoint: !state.deliveryPoint));
  }

  void updatePickupPoint() {
    emit(state.copyWith(pickupPoint: !state.pickupPoint));
  }

  void updateInsurance() {
    emit(state.copyWith(insurance: !state.insurance));
  }

  Future<void> getService(OrderRequest orderRequest) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.getOrderService(
          orderRequest.pickAddressId,
          orderRequest.toProvinceId,
          orderRequest.toDistrictId,
          orderRequest.parcelWeight,
          orderRequest.parcelQuantity,
          orderRequest.parcelLength,
          orderRequest.parcelWidth,
          orderRequest.parcelHeight,
          orderRequest.parcelValue,
          orderRequest.isInsured);
      emit(state.copyWith(isLoading: false));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> selectAddressPick(AddressDataResponse? address) async {
    final indexProvince = state.provinces.indexWhere(
        (element) => element.id.toString() == address!.codes.province);
    updateProvince(state.provinces[indexProvince]);
    final districts =
        await getDistricts(provinceId: int.parse(address!.codes.province));
    final indexDistrict = districts.indexWhere(
        (element) => element.id.toString() == address.codes.district);
    updateDistrict(districts[indexDistrict]);
    final wards = await getWards(districtId: int.parse(address.codes.district));
    final indexWard = wards
        .indexWhere((element) => element.id.toString() == address.codes.ward);
    updateWard(wards[indexWard]);
    emit(state.copyWith(addressPick: address));
  }

  Future<void> selectAddressDeliver(AddressDataResponse? address) async {
    final indexProvince = state.provinces.indexWhere(
        (element) => element.id.toString() == address!.codes.province);
    updateProvinceDeliver(state.provinces[indexProvince]);
    final districts = await getDistrictsDeliver(
        provinceId: int.parse(address!.codes.province));
    final indexDistrict = districts.indexWhere(
        (element) => element.id.toString() == address.codes.district);
    updateDistrictDeliver(districts[indexDistrict]);
    final wards =
        await getWardsDeliver(districtId: int.parse(address.codes.district));
    final indexWard = wards
        .indexWhere((element) => element.id.toString() == address.codes.ward);
    updateWardDeliver(wards[indexWard]);
    emit(state.copyWith(addressDeliver: address));
  }

  //location
  Future<List<AddressDataModel>> getProvinces(
      {AddressDataModel? addressData}) async {
    emit(state.copyWith(isLoading: true));
    final response = await mainRepository.getProvinces();
    final indexProvince = addressData != null
        ? response.data.indexWhere((element) => element.id == addressData.id)
        : -1;

    emit(state.copyWith(
        isLoading: false,
        provinces: response.data,
        province: addressData != null ? response.data[indexProvince] : null));
    return response.data;
  }

  Future<List<AddressDataModel>> getDistricts(
      {required int provinceId,
      AddressDataModel? addressData,
      bool isUpdateProvince = false}) async {
    emit(state.copyWith(isLoading: true, isLoadingDistrict: true));
    final response = await mainRepository.getDistricts(provinceId);
    final indexDistrict = addressData != null
        ? response.data.indexWhere((element) => element.id == addressData.id)
        : -1;

    isUpdateProvince
        ? emit(state.copyWith(
            isLoading: false,
            districts: response.data,
            isLoadingDistrict: false,
            // district: addressData != null ? response.data[indexDistrict] : null,
            district: null,
            ward: null,
            wards: []))
        : emit(state.copyWith(
            isLoading: false,
            districts: response.data,
            isLoadingDistrict: false,
            district: addressData != null ? response.data[indexDistrict] : null,
          ));
    return response.data;
  }

  Future<List<AddressDataModel>> getWards(
      {required int districtId, AddressDataModel? addressData}) async {
    emit(state.copyWith(isLoading: true, isLoadingWard: true));
    final response = await mainRepository.getWards(districtId);
    final indexWard = addressData != null
        ? response.data.indexWhere((element) => element.id == addressData.id)
        : -1;
    emit(state.copyWith(
        isLoading: false,
        wards: response.data,
        isLoadingWard: false,
        ward: addressData != null ? response.data[indexWard] : null));
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

  Future<List<AddressDataModel>> getDistrictsDeliver(
      {required int provinceId,
      AddressDataModel? addressData,
      bool isUpdateProvince = false}) async {
    emit(state.copyWith(isLoading: true, isLoadingDistrict: true));
    final response = await mainRepository.getDistricts(provinceId);
    final indexDistrict = addressData != null
        ? response.data.indexWhere((element) => element.id == addressData.id)
        : -1;

    isUpdateProvince
        ? emit(state.copyWith(
            isLoading: false,
            districtsDeliver: response.data,
            isLoadingDistrict: false,
            // district: addressData != null ? response.data[indexDistrict] : null,
            districtDeliver: null,
            wardDeliver: null,
            wardsDeliver: []))
        : emit(state.copyWith(
            isLoading: false,
            districtsDeliver: response.data,
            isLoadingDistrict: false,
            districtDeliver:
                addressData != null ? response.data[indexDistrict] : null,
          ));
    return response.data;
  }

  Future<List<AddressDataModel>> getWardsDeliver(
      {required int districtId, AddressDataModel? addressData}) async {
    emit(state.copyWith(isLoading: true, isLoadingWard: true));
    final response = await mainRepository.getWards(districtId);
    final indexWard = addressData != null
        ? response.data.indexWhere((element) => element.id == addressData.id)
        : -1;
    emit(state.copyWith(
        isLoading: false,
        wardsDeliver: response.data,
        isLoadingWard: false,
        wardDeliver: addressData != null ? response.data[indexWard] : null));
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
