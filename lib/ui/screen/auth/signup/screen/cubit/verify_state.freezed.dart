// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerifyState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  bool get finishCountdown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyStateCopyWith<VerifyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyStateCopyWith<$Res> {
  factory $VerifyStateCopyWith(
          VerifyState value, $Res Function(VerifyState) then) =
      _$VerifyStateCopyWithImpl<$Res, VerifyState>;
  @useResult
  $Res call(
      {bool isLoading, String error, DateTime? endTime, bool finishCountdown});
}

/// @nodoc
class _$VerifyStateCopyWithImpl<$Res, $Val extends VerifyState>
    implements $VerifyStateCopyWith<$Res> {
  _$VerifyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? endTime = freezed,
    Object? finishCountdown = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishCountdown: null == finishCountdown
          ? _value.finishCountdown
          : finishCountdown // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyStateImplCopyWith<$Res>
    implements $VerifyStateCopyWith<$Res> {
  factory _$$VerifyStateImplCopyWith(
          _$VerifyStateImpl value, $Res Function(_$VerifyStateImpl) then) =
      __$$VerifyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, String error, DateTime? endTime, bool finishCountdown});
}

/// @nodoc
class __$$VerifyStateImplCopyWithImpl<$Res>
    extends _$VerifyStateCopyWithImpl<$Res, _$VerifyStateImpl>
    implements _$$VerifyStateImplCopyWith<$Res> {
  __$$VerifyStateImplCopyWithImpl(
      _$VerifyStateImpl _value, $Res Function(_$VerifyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? endTime = freezed,
    Object? finishCountdown = null,
  }) {
    return _then(_$VerifyStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishCountdown: null == finishCountdown
          ? _value.finishCountdown
          : finishCountdown // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VerifyStateImpl implements _VerifyState {
  const _$VerifyStateImpl(
      {required this.isLoading,
      required this.error,
      this.endTime,
      required this.finishCountdown});

  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final DateTime? endTime;
  @override
  final bool finishCountdown;

  @override
  String toString() {
    return 'VerifyState(isLoading: $isLoading, error: $error, endTime: $endTime, finishCountdown: $finishCountdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.finishCountdown, finishCountdown) ||
                other.finishCountdown == finishCountdown));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, error, endTime, finishCountdown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyStateImplCopyWith<_$VerifyStateImpl> get copyWith =>
      __$$VerifyStateImplCopyWithImpl<_$VerifyStateImpl>(this, _$identity);
}

abstract class _VerifyState implements VerifyState {
  const factory _VerifyState(
      {required final bool isLoading,
      required final String error,
      final DateTime? endTime,
      required final bool finishCountdown}) = _$VerifyStateImpl;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  DateTime? get endTime;
  @override
  bool get finishCountdown;
  @override
  @JsonKey(ignore: true)
  _$$VerifyStateImplCopyWith<_$VerifyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
