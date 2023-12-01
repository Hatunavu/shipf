// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enter_pass_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EnterPassState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnterPassStateCopyWith<EnterPassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnterPassStateCopyWith<$Res> {
  factory $EnterPassStateCopyWith(
          EnterPassState value, $Res Function(EnterPassState) then) =
      _$EnterPassStateCopyWithImpl<$Res, EnterPassState>;
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class _$EnterPassStateCopyWithImpl<$Res, $Val extends EnterPassState>
    implements $EnterPassStateCopyWith<$Res> {
  _$EnterPassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnterPassStateCopyWith<$Res>
    implements $EnterPassStateCopyWith<$Res> {
  factory _$$_EnterPassStateCopyWith(
          _$_EnterPassState value, $Res Function(_$_EnterPassState) then) =
      __$$_EnterPassStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class __$$_EnterPassStateCopyWithImpl<$Res>
    extends _$EnterPassStateCopyWithImpl<$Res, _$_EnterPassState>
    implements _$$_EnterPassStateCopyWith<$Res> {
  __$$_EnterPassStateCopyWithImpl(
      _$_EnterPassState _value, $Res Function(_$_EnterPassState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$_EnterPassState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EnterPassState implements _EnterPassState {
  const _$_EnterPassState({required this.isLoading, this.error});

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'EnterPassState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnterPassState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnterPassStateCopyWith<_$_EnterPassState> get copyWith =>
      __$$_EnterPassStateCopyWithImpl<_$_EnterPassState>(this, _$identity);
}

abstract class _EnterPassState implements EnterPassState {
  const factory _EnterPassState(
      {required final bool isLoading, final String? error}) = _$_EnterPassState;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_EnterPassStateCopyWith<_$_EnterPassState> get copyWith =>
      throw _privateConstructorUsedError;
}
