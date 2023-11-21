import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    String? error,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        isLoading: false,
        error: "",
      );
}
