import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/post/post_response.dart';

part 'user_post_state.freezed.dart';

@freezed
class UserPostState with _$UserPostState {
  const factory UserPostState({
    required bool isLoading,
    required bool isFirstLoad,
    String? error,
    required List<PostData> posts,
  }) = _UserPostState;

  factory UserPostState.initial() => const UserPostState(
      isLoading: false, isFirstLoad: false, error: "", posts: []);
}
