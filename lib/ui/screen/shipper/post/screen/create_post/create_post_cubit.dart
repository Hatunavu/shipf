import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostState.initial());

  Future<void> getProvinces() async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final response = await mainRepository.getProvinces();
      emit(state.copyWith(isFirstLoad: false, provinces: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isFirstLoad: false, error: errorMessage));
    }
  }

  Future<void> updateProvince(AddressDataModel province,
      {bool isDelivery = false}) async {
    if (isDelivery) {
      emit(state.copyWith(provinceDeliver: province, errorProvinceDeliver: ''));
    } else {
      emit(state.copyWith(province: province, errorProvince: ''));
    }
  }

  Future<void> updateProvinceError({bool isDelivery = false}) async {
    if (isDelivery) {
      emit(
          state.copyWith(errorProvinceDeliver: 'Vui lòng chọn Tỉnh/Thành phố'));
    } else {
      emit(state.copyWith(errorProvince: 'Vui lòng chọn Tỉnh/Thành phố'));
    }
  }
}
