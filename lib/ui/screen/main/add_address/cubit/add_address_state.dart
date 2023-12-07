import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';

part 'add_address_state.freezed.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState(
      {required bool isLoading,
      required String error,
      required String errorProvince,
      required String errorDistrict,
      required String errorWard,
      bool? isLoadingDistrict,
      bool? isLoadingWard,
      List<AddressDataModel>? provinces,
      List<AddressDataModel>? districts,
      List<AddressDataModel>? wards,
      AddressDataModel? province,
      AddressDataModel? district,
      AddressDataModel? ward,
      required String errorProvinceDeliver,
      required String errorDistrictDeliver,
      required String errorWardDeliver,
      bool? isLoadingDistrictDeliver,
      bool? isLoadingWardDeliver,
      List<AddressDataModel>? provincesDeliver,
      List<AddressDataModel>? districtsDeliver,
      List<AddressDataModel>? wardsDeliver,
      AddressDataModel? provinceDeliver,
      AddressDataModel? districtDeliver,
      AddressDataModel? wardDeliver}) = _AddAddressState;

  factory AddAddressState.initial() => const AddAddressState(
      isLoading: false,
      error: "",
      errorDistrict: '',
      errorProvince: '',
      errorWard: '',
      errorDistrictDeliver: '',
      errorProvinceDeliver: '',
      errorWardDeliver: '');
}
