import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/address/address_model.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/enums/enum_step_order.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState(
      {required bool isLoading,
      required bool isUpdate,
      String? error,
      required List<OrderService> services,
      OrderService? serviceSelected,
      required StepOrderType stepOrderType,
      required bool pickupPoint,
      required bool deliveryPoint,
      required bool insurance,
      AddressDataResponse? addressPick,
      AddressDataResponse? addressDeliver,
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
      AddressDataModel? wardDeliver}) = _OrderState;

  factory OrderState.initial() => const OrderState(
      isLoading: false,
      error: "",
      stepOrderType: StepOrderType.address,
      services: [],
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
      wardsDeliver: []);
}
