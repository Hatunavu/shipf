// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_complete_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderCompleteState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCompleteStateCopyWith<OrderCompleteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCompleteStateCopyWith<$Res> {
  factory $OrderCompleteStateCopyWith(
          OrderCompleteState value, $Res Function(OrderCompleteState) then) =
      _$OrderCompleteStateCopyWithImpl<$Res, OrderCompleteState>;
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class _$OrderCompleteStateCopyWithImpl<$Res, $Val extends OrderCompleteState>
    implements $OrderCompleteStateCopyWith<$Res> {
  _$OrderCompleteStateCopyWithImpl(this._value, this._then);

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
abstract class _$$OrderCompleteStateImplCopyWith<$Res>
    implements $OrderCompleteStateCopyWith<$Res> {
  factory _$$OrderCompleteStateImplCopyWith(_$OrderCompleteStateImpl value,
          $Res Function(_$OrderCompleteStateImpl) then) =
      __$$OrderCompleteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class __$$OrderCompleteStateImplCopyWithImpl<$Res>
    extends _$OrderCompleteStateCopyWithImpl<$Res, _$OrderCompleteStateImpl>
    implements _$$OrderCompleteStateImplCopyWith<$Res> {
  __$$OrderCompleteStateImplCopyWithImpl(_$OrderCompleteStateImpl _value,
      $Res Function(_$OrderCompleteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$OrderCompleteStateImpl(
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

class _$OrderCompleteStateImpl implements _OrderCompleteState {
  const _$OrderCompleteStateImpl({required this.isLoading, this.error});

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'OrderCompleteState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCompleteStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCompleteStateImplCopyWith<_$OrderCompleteStateImpl> get copyWith =>
      __$$OrderCompleteStateImplCopyWithImpl<_$OrderCompleteStateImpl>(
          this, _$identity);
}

abstract class _OrderCompleteState implements OrderCompleteState {
  const factory _OrderCompleteState(
      {required final bool isLoading,
      final String? error}) = _$OrderCompleteStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$OrderCompleteStateImplCopyWith<_$OrderCompleteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
