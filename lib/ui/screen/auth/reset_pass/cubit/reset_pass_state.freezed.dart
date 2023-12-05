// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPassState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPassStateCopyWith<ResetPassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassStateCopyWith<$Res> {
  factory $ResetPassStateCopyWith(
          ResetPassState value, $Res Function(ResetPassState) then) =
      _$ResetPassStateCopyWithImpl<$Res, ResetPassState>;
  @useResult
  $Res call({bool isLoading, String error});
}

/// @nodoc
class _$ResetPassStateCopyWithImpl<$Res, $Val extends ResetPassState>
    implements $ResetPassStateCopyWith<$Res> {
  _$ResetPassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPassStateCopyWith<$Res>
    implements $ResetPassStateCopyWith<$Res> {
  factory _$$_ResetPassStateCopyWith(
          _$_ResetPassState value, $Res Function(_$_ResetPassState) then) =
      __$$_ResetPassStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String error});
}

/// @nodoc
class __$$_ResetPassStateCopyWithImpl<$Res>
    extends _$ResetPassStateCopyWithImpl<$Res, _$_ResetPassState>
    implements _$$_ResetPassStateCopyWith<$Res> {
  __$$_ResetPassStateCopyWithImpl(
      _$_ResetPassState _value, $Res Function(_$_ResetPassState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_$_ResetPassState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPassState implements _ResetPassState {
  const _$_ResetPassState({required this.isLoading, required this.error});

  @override
  final bool isLoading;
  @override
  final String error;

  @override
  String toString() {
    return 'ResetPassState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPassState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPassStateCopyWith<_$_ResetPassState> get copyWith =>
      __$$_ResetPassStateCopyWithImpl<_$_ResetPassState>(this, _$identity);
}

abstract class _ResetPassState implements ResetPassState {
  const factory _ResetPassState(
      {required final bool isLoading,
      required final String error}) = _$_ResetPassState;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPassStateCopyWith<_$_ResetPassState> get copyWith =>
      throw _privateConstructorUsedError;
}
