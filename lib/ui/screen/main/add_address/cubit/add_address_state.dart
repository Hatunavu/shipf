import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/location/location_model.dart';

part 'add_address_state.freezed.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState(
      {required bool isLoading,
      String? error,
      bool? isLoadingDistrict,
      bool? isLoadingWard,
      List<LocationData>? provinces,
      List<LocationData>? districts,
      List<LocationData>? wards,
      LocationData? province,
      LocationData? district,
      LocationData? ward}) = _AddAddressState;

  factory AddAddressState.initial() =>
      const AddAddressState(isLoading: false, error: "");
}
