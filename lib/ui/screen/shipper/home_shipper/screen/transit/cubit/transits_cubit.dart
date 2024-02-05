import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/cubit/transits_state.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class TransitsCubit extends Cubit<TransitsState> {
  TransitsCubit() : super(TransitsState.initial());

  Future<void> getTransits(LoadingType type) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response =
          await mainRepository.getTransits(type: type.toJsonString());
      emit(state.copyWith(isLoading: false, listTransitData: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  Future<void> cancelTransit({required int transitId}) async {
    try {
      emit(state.copyWith(isUpdating: true));
      await mainRepository.cancelTransit(transitId: transitId);
      ToastUtils.showSuccess('Huỷ chuyến thành công');
      emit(state.copyWith(isUpdating: false));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      ToastUtils.showSuccess('Huỷ chuyến thất bại');
      emit(state.copyWith(isUpdating: false, error: errorMessage));
    }
  }

  Future<bool> acceptTransit({required int transitId}) async {
    try {
      emit(state.copyWith(isUpdating: true));
      await mainRepository.acceptTransit(transitId: transitId);
      ToastUtils.showSuccess('Nhận chuyến thành công');
      emit(state.copyWith(isUpdating: false));
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      ToastUtils.showSuccess('Nhận chuyến thất bại');
      emit(state.copyWith(isUpdating: false, error: errorMessage));
      return false;
    }
  }
}
