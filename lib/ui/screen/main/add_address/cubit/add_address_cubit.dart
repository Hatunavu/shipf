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
            wards: null))
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
}
