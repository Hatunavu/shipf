import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressState.initial());

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
      bool isRecipients = false}) async {
    emit(state.copyWith(isLoading: true, isLoadingDistrict: true));
    final response = await mainRepository.getDistricts(provinceId);
    final indexDistrict = addressData != null
        ? response.data.indexWhere((element) => element.id == addressData.id)
        : -1;

    emit(state.copyWith(
        isLoading: false,
        districts: isRecipients ? null : response.data,
        recipientsDistricts: isRecipients ? response.data : null,
        isLoadingDistrict: false,
        district: null,
        ward: null,
        wards: null));

    return response.data;
  }

  Future<List<AddressDataModel>> getWards(
      {required int districtId,
      AddressDataModel? addressData,
      bool isRecipients = false}) async {
    emit(state.copyWith(isLoading: true, isLoadingWard: true));
    final response = await mainRepository.getWards(districtId);
    final indexWard = addressData != null
        ? response.data.indexWhere((element) => element.id == addressData.id)
        : -1;
    emit(state.copyWith(
        isLoading: false,
        wards: isRecipients ? null : response.data,
        recipientsWards: isRecipients ? response.data : null,
        isLoadingWard: false,
        ward: addressData != null ? response.data[indexWard] : null));
    return response.data;
  }

  Future<void> updateProvince(AddressDataModel province,
      {bool isRecipients = false}) async {
    isRecipients
        ? emit(state.copyWith(recipientsProvince: province))
        : emit(state.copyWith(province: province));
  }

  Future<void> updateDistrict(AddressDataModel district,
      {bool isRecipients = false}) async {
    isRecipients
        ? emit(state.copyWith(recipientsDistrict: district))
        : emit(state.copyWith(district: district));
  }

  Future<void> updateWard(AddressDataModel ward,
      {bool isRecipients = false}) async {
    isRecipients
        ? emit(state.copyWith(recipientsWard: ward))
        : emit(state.copyWith(ward: ward));
  }
}
