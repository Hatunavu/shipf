import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';

part 'add_address_state.freezed.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState(
      {required bool isLoading,
      String? error,
      bool? isLoadingDistrict,
      bool? isLoadingWard,
      List<AddressDataModel>? provinces,
      List<AddressDataModel>? districts,
      List<AddressDataModel>? wards,
      AddressDataModel? province,
      AddressDataModel? district,
      AddressDataModel? ward}) = _AddAddressState;

  factory AddAddressState.initial() =>
      const AddAddressState(isLoading: false, error: "");
}
