import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/post/post_response.dart';

part 'user_post_state.freezed.dart';

@freezed
class UserPostState with _$UserPostState {
  const factory UserPostState(
      {required bool isLoading,
      required bool isFirstLoad,
      String? error,
      required List<PostData> posts,
      required int page,
      required bool hasReachedEnd}) = _UserPostState;

  factory UserPostState.initial() => const UserPostState(
      isLoading: false,
      isFirstLoad: false,
      error: "",
      posts: [],
      page: 0,
      hasReachedEnd: false);
}
