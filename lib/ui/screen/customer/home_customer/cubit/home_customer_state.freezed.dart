// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_customer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeCustomerState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeCustomerStateCopyWith<HomeCustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCustomerStateCopyWith<$Res> {
  factory $HomeCustomerStateCopyWith(
          HomeCustomerState value, $Res Function(HomeCustomerState) then) =
      _$HomeCustomerStateCopyWithImpl<$Res, HomeCustomerState>;
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class _$HomeCustomerStateCopyWithImpl<$Res, $Val extends HomeCustomerState>
    implements $HomeCustomerStateCopyWith<$Res> {
  _$HomeCustomerStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_HomeCustomerStateCopyWith<$Res>
    implements $HomeCustomerStateCopyWith<$Res> {
  factory _$$_HomeCustomerStateCopyWith(_$_HomeCustomerState value,
          $Res Function(_$_HomeCustomerState) then) =
      __$$_HomeCustomerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class __$$_HomeCustomerStateCopyWithImpl<$Res>
    extends _$HomeCustomerStateCopyWithImpl<$Res, _$_HomeCustomerState>
    implements _$$_HomeCustomerStateCopyWith<$Res> {
  __$$_HomeCustomerStateCopyWithImpl(
      _$_HomeCustomerState _value, $Res Function(_$_HomeCustomerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$_HomeCustomerState(
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

class _$_HomeCustomerState implements _HomeCustomerState {
  const _$_HomeCustomerState({required this.isLoading, this.error});

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HomeCustomerState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeCustomerState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeCustomerStateCopyWith<_$_HomeCustomerState> get copyWith =>
      __$$_HomeCustomerStateCopyWithImpl<_$_HomeCustomerState>(
          this, _$identity);
}

abstract class _HomeCustomerState implements HomeCustomerState {
  const factory _HomeCustomerState(
      {required final bool isLoading,
      final String? error}) = _$_HomeCustomerState;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HomeCustomerStateCopyWith<_$_HomeCustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}
