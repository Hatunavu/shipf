import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/address/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressState.initial());

  Future<void> getAddresses(bool isDeliver) async {
    try {
      emit(state.copyWith(isLoading: true));
      final AddressSaved response;
      if (isDeliver) {
        response = await mainRepository.getAddresses(
            type: LoadingType.delivery.toJsonString());
      } else {
        response = await mainRepository.getAddresses(
            type: LoadingType.pickup.toJsonString());
      }
      emit(state.copyWith(isLoading: false, addresses: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }
}
