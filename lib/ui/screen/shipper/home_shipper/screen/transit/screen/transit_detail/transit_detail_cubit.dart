import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/screen/transit_detail/transit_detail_state.dart';

class TransitDetailCubit extends Cubit<TransitDetailState> {
  TransitDetailCubit() : super(TransitDetailState.initial());

  Future<void> getTransitDetail({required int transitId}) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response =
          await mainRepository.getTransitDetail(transitId: transitId);
      emit(state.copyWith(isLoading: false, transitData: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
