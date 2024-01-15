// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_shipper_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeShipperState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeShipperStateCopyWith<HomeShipperState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeShipperStateCopyWith<$Res> {
  factory $HomeShipperStateCopyWith(
          HomeShipperState value, $Res Function(HomeShipperState) then) =
      _$HomeShipperStateCopyWithImpl<$Res, HomeShipperState>;
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class _$HomeShipperStateCopyWithImpl<$Res, $Val extends HomeShipperState>
    implements $HomeShipperStateCopyWith<$Res> {
  _$HomeShipperStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_HomeShipperStateCopyWith<$Res>
    implements $HomeShipperStateCopyWith<$Res> {
  factory _$$_HomeShipperStateCopyWith(
          _$_HomeShipperState value, $Res Function(_$_HomeShipperState) then) =
      __$$_HomeShipperStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class __$$_HomeShipperStateCopyWithImpl<$Res>
    extends _$HomeShipperStateCopyWithImpl<$Res, _$_HomeShipperState>
    implements _$$_HomeShipperStateCopyWith<$Res> {
  __$$_HomeShipperStateCopyWithImpl(
      _$_HomeShipperState _value, $Res Function(_$_HomeShipperState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$_HomeShipperState(
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

class _$_HomeShipperState implements _HomeShipperState {
  const _$_HomeShipperState({required this.isLoading, this.error});

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HomeShipperState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeShipperState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeShipperStateCopyWith<_$_HomeShipperState> get copyWith =>
      __$$_HomeShipperStateCopyWithImpl<_$_HomeShipperState>(this, _$identity);
}

abstract class _HomeShipperState implements HomeShipperState {
  const factory _HomeShipperState(
      {required final bool isLoading,
      final String? error}) = _$_HomeShipperState;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_HomeShipperStateCopyWith<_$_HomeShipperState> get copyWith =>
      throw _privateConstructorUsedError;
}
