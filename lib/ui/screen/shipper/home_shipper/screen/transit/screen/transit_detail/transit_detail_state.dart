import 'package:freezed_annotation/freezed_annotation.dart';

part 'transit_detail_state.freezed.dart';

@freezed
class TransitDetailState with _$TransitDetailState {
  const factory TransitDetailState({required bool isLoading, String? error}) =
      _TransitDetailState;

  factory TransitDetailState.initial() =>
      const TransitDetailState(isLoading: false, error: "");
}
