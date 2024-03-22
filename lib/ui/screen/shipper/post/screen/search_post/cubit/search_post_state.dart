import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';

part 'search_post_state.freezed.dart';

@freezed
class SearchPostState with _$SearchPostState {
  const factory SearchPostState(
      {required bool isLoading,
      required bool isFirstLoad,
      String? error,
      required List<AddressDataModel> provinces}) = _SearchPostState;

  factory SearchPostState.initial() => const SearchPostState(
      isLoading: false, isFirstLoad: false, error: "", provinces: []);
}
