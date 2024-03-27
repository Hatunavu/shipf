import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/post/screen/search_post/cubit/search_post_state.dart';

class SearchPostCubit extends Cubit<SearchPostState> {
  SearchPostCubit() : super(SearchPostState.initial());

  Future init(
      {TonnageType? tonnage,
      List<AddressDataModel> selectedProvinces = const [],
      List<AddressDataModel> selectedProvincesDeliver = const []}) async {
    try {
      emit(state.copyWith(isLoading: true, isFirstLoad: true));
      await getProvinces();
      emit(state.copyWith(
          isLoading: false,
          isFirstLoad: false,
          tonnage: tonnage,
          selectedProvinces: selectedProvinces,
          selectedProvincesDeliver: selectedProvincesDeliver));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isLoading: false, isFirstLoad: false, error: errorMessage));
    }
  }

  Future<void> getProvinces() async {
    final response = await mainRepository.getProvinces();
    emit(state.copyWith(
      provinces: response.data,
    ));
  }

  Future<void> updateProvince(List<AddressDataModel> provinces,
      {bool isDelivery = false}) async {
    if (isDelivery) {
      emit(state.copyWith(selectedProvincesDeliver: provinces));
    } else {
      emit(state.copyWith(selectedProvinces: provinces));
    }
  }

  Future<void> updateTonnage({TonnageType? tonnage}) async {
    emit(state.copyWith(tonnage: tonnage));
  }
}
