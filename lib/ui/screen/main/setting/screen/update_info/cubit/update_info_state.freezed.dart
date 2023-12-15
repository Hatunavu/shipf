// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateInfoStateCopyWith<UpdateInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoStateCopyWith<$Res> {
  factory $UpdateInfoStateCopyWith(
          UpdateInfoState value, $Res Function(UpdateInfoState) then) =
      _$UpdateInfoStateCopyWithImpl<$Res, UpdateInfoState>;
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class _$UpdateInfoStateCopyWithImpl<$Res, $Val extends UpdateInfoState>
    implements $UpdateInfoStateCopyWith<$Res> {
  _$UpdateInfoStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_UpdateInfoStateCopyWith<$Res>
    implements $UpdateInfoStateCopyWith<$Res> {
  factory _$$_UpdateInfoStateCopyWith(
          _$_UpdateInfoState value, $Res Function(_$_UpdateInfoState) then) =
      __$$_UpdateInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class __$$_UpdateInfoStateCopyWithImpl<$Res>
    extends _$UpdateInfoStateCopyWithImpl<$Res, _$_UpdateInfoState>
    implements _$$_UpdateInfoStateCopyWith<$Res> {
  __$$_UpdateInfoStateCopyWithImpl(
      _$_UpdateInfoState _value, $Res Function(_$_UpdateInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$_UpdateInfoState(
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

class _$_UpdateInfoState implements _UpdateInfoState {
  const _$_UpdateInfoState({required this.isLoading, this.error});

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'UpdateInfoState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInfoState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateInfoStateCopyWith<_$_UpdateInfoState> get copyWith =>
      __$$_UpdateInfoStateCopyWithImpl<_$_UpdateInfoState>(this, _$identity);
}

abstract class _UpdateInfoState implements UpdateInfoState {
  const factory _UpdateInfoState(
      {required final bool isLoading,
      final String? error}) = _$_UpdateInfoState;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateInfoStateCopyWith<_$_UpdateInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
