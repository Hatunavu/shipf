import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    required bool isLoading,
    required bool isFirstLoad,
    String? error,
    required List goods,
  }) = _PostState;

  factory PostState.initial() => const PostState(
      isLoading: false, error: "", isFirstLoad: false, goods: []);
}
