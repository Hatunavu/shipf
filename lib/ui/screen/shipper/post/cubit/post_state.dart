import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/post/post_response.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState(
      {required bool isLoading,
      required bool isFirstLoad,
      String? error,
      required List<PostData> posts,
      required int page,
      required bool hasReachedEnd}) = _PostState;

  factory PostState.initial() => const PostState(
      isLoading: false,
      error: "",
      isFirstLoad: false,
      posts: [],
      page: 0,
      hasReachedEnd: false);
}
