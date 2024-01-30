// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShipmentsState {
  bool get isFirstLoad => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<ShipmentData> get shipments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShipmentsStateCopyWith<ShipmentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipmentsStateCopyWith<$Res> {
  factory $ShipmentsStateCopyWith(
          ShipmentsState value, $Res Function(ShipmentsState) then) =
      _$ShipmentsStateCopyWithImpl<$Res, ShipmentsState>;
  @useResult
  $Res call(
      {bool isFirstLoad,
      bool isLoading,
      String? error,
      List<ShipmentData> shipments});
}

/// @nodoc
class _$ShipmentsStateCopyWithImpl<$Res, $Val extends ShipmentsState>
    implements $ShipmentsStateCopyWith<$Res> {
  _$ShipmentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstLoad = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? shipments = null,
  }) {
    return _then(_value.copyWith(
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      shipments: null == shipments
          ? _value.shipments
          : shipments // ignore: cast_nullable_to_non_nullable
              as List<ShipmentData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShipmentsStateImplCopyWith<$Res>
    implements $ShipmentsStateCopyWith<$Res> {
  factory _$$ShipmentsStateImplCopyWith(_$ShipmentsStateImpl value,
          $Res Function(_$ShipmentsStateImpl) then) =
      __$$ShipmentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFirstLoad,
      bool isLoading,
      String? error,
      List<ShipmentData> shipments});
}

/// @nodoc
class __$$ShipmentsStateImplCopyWithImpl<$Res>
    extends _$ShipmentsStateCopyWithImpl<$Res, _$ShipmentsStateImpl>
    implements _$$ShipmentsStateImplCopyWith<$Res> {
  __$$ShipmentsStateImplCopyWithImpl(
      _$ShipmentsStateImpl _value, $Res Function(_$ShipmentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstLoad = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? shipments = null,
  }) {
    return _then(_$ShipmentsStateImpl(
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      shipments: null == shipments
          ? _value._shipments
          : shipments // ignore: cast_nullable_to_non_nullable
              as List<ShipmentData>,
    ));
  }
}

/// @nodoc

class _$ShipmentsStateImpl implements _ShipmentsState {
  const _$ShipmentsStateImpl(
      {required this.isFirstLoad,
      required this.isLoading,
      this.error,
      required final List<ShipmentData> shipments})
      : _shipments = shipments;

  @override
  final bool isFirstLoad;
  @override
  final bool isLoading;
  @override
  final String? error;
  final List<ShipmentData> _shipments;
  @override
  List<ShipmentData> get shipments {
    if (_shipments is EqualUnmodifiableListView) return _shipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipments);
  }

  @override
  String toString() {
    return 'ShipmentsState(isFirstLoad: $isFirstLoad, isLoading: $isLoading, error: $error, shipments: $shipments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentsStateImpl &&
            (identical(other.isFirstLoad, isFirstLoad) ||
                other.isFirstLoad == isFirstLoad) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._shipments, _shipments));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFirstLoad, isLoading, error,
      const DeepCollectionEquality().hash(_shipments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentsStateImplCopyWith<_$ShipmentsStateImpl> get copyWith =>
      __$$ShipmentsStateImplCopyWithImpl<_$ShipmentsStateImpl>(
          this, _$identity);
}

abstract class _ShipmentsState implements ShipmentsState {
  const factory _ShipmentsState(
      {required final bool isFirstLoad,
      required final bool isLoading,
      final String? error,
      required final List<ShipmentData> shipments}) = _$ShipmentsStateImpl;

  @override
  bool get isFirstLoad;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  List<ShipmentData> get shipments;
  @override
  @JsonKey(ignore: true)
  _$$ShipmentsStateImplCopyWith<_$ShipmentsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
