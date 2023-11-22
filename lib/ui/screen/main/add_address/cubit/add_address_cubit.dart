import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/location/location_model.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_state.dart';

final responseProvinces = LocationModel(status: 200, message: 'message', data: [
  LocationData(code: '01', name: 'Hà Nội'),
  LocationData(code: '02', name: 'Hồ Chí Minh')
]);

final responseDistricts = LocationModel(status: 200, message: 'message', data: [
  LocationData(code: '001', name: 'Ba Đình'),
  LocationData(code: '002', name: 'Cầu Giấy')
]);

final responseWards = LocationModel(status: 200, message: 'message', data: [
  LocationData(code: '0001', name: 'Cống Vị'),
  LocationData(code: '0002', name: 'Đội Cấn')
]);

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressState.initial());

  Future<List<LocationData>> getLocationProvinces() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    final response = responseProvinces;

    emit(state.copyWith(
        isLoading: false, provinces: response.data, province: null));
    return response.data;
  }

  Future<List<LocationData>> getLocationDistricts(
      {required String provinceId, bool? isUpdateProvince}) async {
    emit(state.copyWith(isLoading: true, isLoadingDistrict: true));
    await Future.delayed(const Duration(seconds: 2));
    final response = responseDistricts;

    emit(state.copyWith(
      isLoading: false,
      districts: response.data,
      isLoadingDistrict: false,
    ));

    return response.data;
  }

  Future<List<LocationData>> getLocationWards({
    required String districtId,
  }) async {
    emit(state.copyWith(isLoading: true, isLoadingWard: true));
    await Future.delayed(const Duration(seconds: 2));
    final response = responseWards;

    emit(state.copyWith(
      isLoading: false,
      wards: response.data,
      isLoadingWard: false,
    ));
    return response.data;
  }

  Future<void> updateProvince(LocationData province) async {
    emit(state.copyWith(province: province));
  }

  Future<void> updateDistrict(LocationData district) async {
    emit(state.copyWith(district: district));
  }

  Future<void> updateWard(LocationData ward) async {
    emit(state.copyWith(ward: ward));
  }
}
