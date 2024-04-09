// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuoteState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFirstLoad => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  TonnageType? get tonnage => throw _privateConstructorUsedError;
  String get errorTonnage => throw _privateConstructorUsedError;
  TextEditingController? get noteController =>
      throw _privateConstructorUsedError;
  TextEditingController? get priceController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuoteStateCopyWith<QuoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteStateCopyWith<$Res> {
  factory $QuoteStateCopyWith(
          QuoteState value, $Res Function(QuoteState) then) =
      _$QuoteStateCopyWithImpl<$Res, QuoteState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      TonnageType? tonnage,
      String errorTonnage,
      TextEditingController? noteController,
      TextEditingController? priceController});
}

/// @nodoc
class _$QuoteStateCopyWithImpl<$Res, $Val extends QuoteState>
    implements $QuoteStateCopyWith<$Res> {
  _$QuoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstLoad = null,
    Object? error = freezed,
    Object? tonnage = freezed,
    Object? errorTonnage = null,
    Object? noteController = freezed,
    Object? priceController = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      tonnage: freezed == tonnage
          ? _value.tonnage
          : tonnage // ignore: cast_nullable_to_non_nullable
              as TonnageType?,
      errorTonnage: null == errorTonnage
          ? _value.errorTonnage
          : errorTonnage // ignore: cast_nullable_to_non_nullable
              as String,
      noteController: freezed == noteController
          ? _value.noteController
          : noteController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      priceController: freezed == priceController
          ? _value.priceController
          : priceController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteStateCopyWith<$Res>
    implements $QuoteStateCopyWith<$Res> {
  factory _$$_QuoteStateCopyWith(
          _$_QuoteState value, $Res Function(_$_QuoteState) then) =
      __$$_QuoteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      TonnageType? tonnage,
      String errorTonnage,
      TextEditingController? noteController,
      TextEditingController? priceController});
}

/// @nodoc
class __$$_QuoteStateCopyWithImpl<$Res>
    extends _$QuoteStateCopyWithImpl<$Res, _$_QuoteState>
    implements _$$_QuoteStateCopyWith<$Res> {
  __$$_QuoteStateCopyWithImpl(
      _$_QuoteState _value, $Res Function(_$_QuoteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstLoad = null,
    Object? error = freezed,
    Object? tonnage = freezed,
    Object? errorTonnage = null,
    Object? noteController = freezed,
    Object? priceController = freezed,
  }) {
    return _then(_$_QuoteState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      tonnage: freezed == tonnage
          ? _value.tonnage
          : tonnage // ignore: cast_nullable_to_non_nullable
              as TonnageType?,
      errorTonnage: null == errorTonnage
          ? _value.errorTonnage
          : errorTonnage // ignore: cast_nullable_to_non_nullable
              as String,
      noteController: freezed == noteController
          ? _value.noteController
          : noteController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      priceController: freezed == priceController
          ? _value.priceController
          : priceController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ));
  }
}

/// @nodoc

class _$_QuoteState implements _QuoteState {
  const _$_QuoteState(
      {required this.isLoading,
      required this.isFirstLoad,
      this.error,
      this.tonnage,
      required this.errorTonnage,
      this.noteController,
      this.priceController});

  @override
  final bool isLoading;
  @override
  final bool isFirstLoad;
  @override
  final String? error;
  @override
  final TonnageType? tonnage;
  @override
  final String errorTonnage;
  @override
  final TextEditingController? noteController;
  @override
  final TextEditingController? priceController;

  @override
  String toString() {
    return 'QuoteState(isLoading: $isLoading, isFirstLoad: $isFirstLoad, error: $error, tonnage: $tonnage, errorTonnage: $errorTonnage, noteController: $noteController, priceController: $priceController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuoteState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFirstLoad, isFirstLoad) ||
                other.isFirstLoad == isFirstLoad) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.tonnage, tonnage) || other.tonnage == tonnage) &&
            (identical(other.errorTonnage, errorTonnage) ||
                other.errorTonnage == errorTonnage) &&
            (identical(other.noteController, noteController) ||
                other.noteController == noteController) &&
            (identical(other.priceController, priceController) ||
                other.priceController == priceController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isFirstLoad, error,
      tonnage, errorTonnage, noteController, priceController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteStateCopyWith<_$_QuoteState> get copyWith =>
      __$$_QuoteStateCopyWithImpl<_$_QuoteState>(this, _$identity);
}

abstract class _QuoteState implements QuoteState {
  const factory _QuoteState(
      {required final bool isLoading,
      required final bool isFirstLoad,
      final String? error,
      final TonnageType? tonnage,
      required final String errorTonnage,
      final TextEditingController? noteController,
      final TextEditingController? priceController}) = _$_QuoteState;

  @override
  bool get isLoading;
  @override
  bool get isFirstLoad;
  @override
  String? get error;
  @override
  TonnageType? get tonnage;
  @override
  String get errorTonnage;
  @override
  TextEditingController? get noteController;
  @override
  TextEditingController? get priceController;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteStateCopyWith<_$_QuoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
