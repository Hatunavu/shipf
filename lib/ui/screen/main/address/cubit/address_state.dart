import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/data/model/address/address.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    required bool isLoading,
    String? error,
    required List<AddressSavedData> addresses,
  }) = _AddressState;

  factory AddressState.initial() =>
      const AddressState(isLoading: false, error: "", addresses: []);
}
