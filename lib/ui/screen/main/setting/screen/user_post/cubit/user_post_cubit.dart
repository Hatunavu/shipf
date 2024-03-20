import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/main/setting/screen/user_post/cubit/user_post_state.dart';

class UserPostCubit extends Cubit<UserPostState> {
  UserPostCubit() : super(UserPostState.initial());

  Future<void> getPostSaved() async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final response = await mainRepository.getPostSaved(
          status: PostStatusType.draft.toJsonString());
      emit(state.copyWith(isFirstLoad: false, posts: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isFirstLoad: false, error: errorMessage));
    }
  }
}
