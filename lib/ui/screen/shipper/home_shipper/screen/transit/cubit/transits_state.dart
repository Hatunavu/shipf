import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/transit/transit_response.dart';

part 'transits_state.freezed.dart';

@freezed
class TransitsState with _$TransitsState {
  const factory TransitsState(
      {required bool isLoading,
      required bool isUpdating,
      String? error,
      required List<TransitData> listTransitData}) = _TransitsState;

  factory TransitsState.initial() => const TransitsState(
      isLoading: false, error: "", listTransitData: [], isUpdating: false);
}
