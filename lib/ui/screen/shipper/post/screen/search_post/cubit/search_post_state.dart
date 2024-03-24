import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/enums/enum_tonnage.dart';

part 'search_post_state.freezed.dart';

@freezed
class SearchPostState with _$SearchPostState {
  const factory SearchPostState({
    required bool isLoading,
    required bool isFirstLoad,
    String? error,
    required List<AddressDataModel> provinces,
    required List<AddressDataModel> selectedProvinces,
    required List<AddressDataModel> selectedProvincesDeliver,
    TonnageType? tonnage,
  }) = _SearchPostState;

  factory SearchPostState.initial() => const SearchPostState(
      isLoading: false,
      isFirstLoad: false,
      error: "",
      provinces: [],
      selectedProvinces: [],
      selectedProvincesDeliver: []);
}
