import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/post/cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState.initial());

  Future<void> getPosts() async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final response = await mainRepository.getPost();
      emit(state.copyWith(isFirstLoad: false, posts: response.data));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isFirstLoad: false, error: errorMessage));
    }
  }
}
