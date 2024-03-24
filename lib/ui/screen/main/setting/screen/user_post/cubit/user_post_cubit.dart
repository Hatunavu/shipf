import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/setting/screen/user_post/cubit/user_post_state.dart';

class UserPostCubit extends Cubit<UserPostState> {
  UserPostCubit() : super(UserPostState.initial());

  Future<void> getPosts({
    TonnageType? tonnage,
    List<AddressDataModel> provinces = const [],
    List<AddressDataModel> provincesDelivery = const [],
  }) async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final List<String> pickupProvinceIds =
          provinces.map((e) => e.id.toString()).toList();
      final List<String> deliveryProvinceIds =
          provincesDelivery.map((e) => e.id.toString()).toList();
      final response = await mainRepository.getPost(
        isOwner: true,
        tonnage: tonnage?.toJsonString(),
        pickupProvinceIds: pickupProvinceIds,
        deliveryProvinceIds: deliveryProvinceIds,
      );
      final bool hasReachedEnd =
          response.data.length == response.metadata!.totalElements;
      emit(state.copyWith(
          isFirstLoad: false,
          posts: response.data,
          hasReachedEnd: hasReachedEnd,
          tonnageSearch: tonnage,
          provincesSearch: provinces,
          provincesDeliverySearch: provincesDelivery));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isFirstLoad: false, isLoading: false, error: errorMessage));
    }
  }

  Future<void> seeMorePosts() async {
    try {
      emit(state.copyWith(isLoading: true));
      final List<String> pickupProvinceIds =
          state.provincesSearch.map((e) => e.id.toString()).toList();
      final List<String> deliveryProvinceIds =
          state.provincesDeliverySearch.map((e) => e.id.toString()).toList();
      final response = await mainRepository.getPost(
          isOwner: true,
          page: state.page + 1,
          tonnage: state.tonnageSearch?.toJsonString(),
          pickupProvinceIds: pickupProvinceIds,
          deliveryProvinceIds: deliveryProvinceIds);
      final List<PostData> newList = [...state.posts, ...response.data];
      final bool hasReachedEnd =
          newList.length == response.metadata!.totalElements;
      emit(state.copyWith(
          isLoading: false,
          posts: newList,
          page: state.page + 1,
          hasReachedEnd: hasReachedEnd));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
