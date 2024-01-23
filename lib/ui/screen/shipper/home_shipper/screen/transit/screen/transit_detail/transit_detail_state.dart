import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/transit/transit_response.dart';

part 'transit_detail_state.freezed.dart';

@freezed
class TransitDetailState with _$TransitDetailState {
  const factory TransitDetailState(
      {required bool isLoading,
      String? error,
      TransitData? transitData}) = _TransitDetailState;

  factory TransitDetailState.initial() =>
      const TransitDetailState(isLoading: false, error: "");
}
