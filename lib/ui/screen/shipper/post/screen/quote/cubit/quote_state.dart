import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipf/enums/enum_tonnage.dart';

part 'quote_state.freezed.dart';

@freezed
class QuoteState with _$QuoteState {
  const factory QuoteState({
    required bool isLoading,
    required bool isFirstLoad,
    String? error,
    TonnageType? tonnage,
    required String errorTonnage,
    TextEditingController? noteController,
    TextEditingController? priceController,
  }) = _QuoteState;

  factory QuoteState.initial() => const QuoteState(
      isLoading: false, isFirstLoad: false, error: "", errorTonnage: '');
}
