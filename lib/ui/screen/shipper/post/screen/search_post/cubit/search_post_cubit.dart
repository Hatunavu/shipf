import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/post/screen/search_post/cubit/search_post_state.dart';

class SearchPostCubit extends Cubit<SearchPostState> {
  SearchPostCubit() : super(SearchPostState.initial());

  Future<void> getProvinces() async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final response = await mainRepository.getShipments();
      emit(state.copyWith(isFirstLoad: false));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isFirstLoad: false, error: errorMessage));
    }
  }
}
