import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_info_state.freezed.dart';

@freezed
class UpdateInfoState with _$UpdateInfoState {
  const factory UpdateInfoState({
    required bool isLoading,
    String? error,
  }) = _UpdateInfoState;

  factory UpdateInfoState.initial() => const UpdateInfoState(
        isLoading: false,
        error: "",
      );
}
