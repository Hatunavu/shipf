import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/enums/enum_tonnage.dart';

part 'user_post_state.freezed.dart';

@freezed
class UserPostState with _$UserPostState {
  const factory UserPostState({
    required bool isLoading,
    required bool isFirstLoad,
    String? error,
    required List<PostData> posts,
    required int page,
    required bool hasReachedEnd,
    TonnageType? tonnageSearch,
    required List<AddressDataModel> provincesSearch,
    required List<AddressDataModel> provincesDeliverySearch,
  }) = _UserPostState;

  factory UserPostState.initial() => const UserPostState(
      isLoading: false,
      isFirstLoad: false,
      error: "",
      posts: [],
      page: 0,
      hasReachedEnd: false,
      provincesDeliverySearch: [],
      provincesSearch: []);
}
