import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/screen/shipper/post/cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState.initial());

  Future<void> getPosts() async {
    try {
      emit(state.copyWith(isFirstLoad: true));
      final response = await mainRepository.getPost();
      final bool hasReachedEnd =
          response.data.length == response.metadata!.totalElements;
      emit(state.copyWith(
          isFirstLoad: false,
          posts: response.data,
          hasReachedEnd: hasReachedEnd));
    } on DioError catch (e) {
      final errorMessage = mainRepository.mapDioErrorToMessage(e);
      emit(state.copyWith(isFirstLoad: false, error: errorMessage));
    }
  }

  Future<void> seeMorePosts() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await mainRepository.getPost(page: state.page + 1);
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
