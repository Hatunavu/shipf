import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/post/post_request.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/post/screen/quote/cubit/quote_state.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteState.initial());

  Future init() async {
    try {
      emit(state.copyWith(isLoading: true, isFirstLoad: true));
      emit(state.copyWith(
        isLoading: false,
        isFirstLoad: false,
        noteController: TextEditingController(),
        priceController: TextEditingController(),
      ));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(
          isLoading: false, isFirstLoad: false, error: errorMessage));
    }
  }

  Future<bool> quote({required int postId}) async {
    try {
      emit(state.copyWith(isLoading: true));
      await mainRepository.quote(
          quoteRequest: QuoteRequest(
              postId: postId,
              tonnageType: state.tonnage!,
              note: state.noteController!.text,
              priceList:
                  int.parse(state.priceController!.text.replaceAll(',', ''))));
      emit(state.copyWith(
        isLoading: false,
      ));
      ToastUtils.showSuccess('Báo giá thành công');
      return true;
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return false;
    }
  }

  Future<void> updateTonnage(TonnageType tonnage) async {
    emit(state.copyWith(tonnage: tonnage, errorTonnage: ''));
  }

  Future<void> updateTonnageError() async {
    emit(state.copyWith(errorTonnage: 'Vui lòng chọn loại xe'));
  }
}
