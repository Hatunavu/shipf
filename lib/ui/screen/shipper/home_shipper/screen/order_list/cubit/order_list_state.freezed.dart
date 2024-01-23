// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderListState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<ShipmentData> get listOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderListStateCopyWith<OrderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderListStateCopyWith<$Res> {
  factory $OrderListStateCopyWith(
          OrderListState value, $Res Function(OrderListState) then) =
      _$OrderListStateCopyWithImpl<$Res, OrderListState>;
  @useResult
  $Res call({bool isLoading, String? error, List<ShipmentData> listOrder});
}

/// @nodoc
class _$OrderListStateCopyWithImpl<$Res, $Val extends OrderListState>
    implements $OrderListStateCopyWith<$Res> {
  _$OrderListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? listOrder = null,
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
      listOrder: null == listOrder
          ? _value.listOrder
          : listOrder // ignore: cast_nullable_to_non_nullable
              as List<ShipmentData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderListStateCopyWith<$Res>
    implements $OrderListStateCopyWith<$Res> {
  factory _$$_OrderListStateCopyWith(
          _$_OrderListState value, $Res Function(_$_OrderListState) then) =
      __$$_OrderListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, List<ShipmentData> listOrder});
}

/// @nodoc
class __$$_OrderListStateCopyWithImpl<$Res>
    extends _$OrderListStateCopyWithImpl<$Res, _$_OrderListState>
    implements _$$_OrderListStateCopyWith<$Res> {
  __$$_OrderListStateCopyWithImpl(
      _$_OrderListState _value, $Res Function(_$_OrderListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? listOrder = null,
  }) {
    return _then(_$_OrderListState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      listOrder: null == listOrder
          ? _value._listOrder
          : listOrder // ignore: cast_nullable_to_non_nullable
              as List<ShipmentData>,
    ));
  }
}

/// @nodoc

class _$_OrderListState implements _OrderListState {
  const _$_OrderListState(
      {required this.isLoading,
      this.error,
      required final List<ShipmentData> listOrder})
      : _listOrder = listOrder;

  @override
  final bool isLoading;
  @override
  final String? error;
  final List<ShipmentData> _listOrder;
  @override
  List<ShipmentData> get listOrder {
    if (_listOrder is EqualUnmodifiableListView) return _listOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOrder);
  }

  @override
  String toString() {
    return 'OrderListState(isLoading: $isLoading, error: $error, listOrder: $listOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._listOrder, _listOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_listOrder));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderListStateCopyWith<_$_OrderListState> get copyWith =>
      __$$_OrderListStateCopyWithImpl<_$_OrderListState>(this, _$identity);
}

abstract class _OrderListState implements OrderListState {
  const factory _OrderListState(
      {required final bool isLoading,
      final String? error,
      required final List<ShipmentData> listOrder}) = _$_OrderListState;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  List<ShipmentData> get listOrder;
  @override
  @JsonKey(ignore: true)
  _$$_OrderListStateCopyWith<_$_OrderListState> get copyWith =>
      throw _privateConstructorUsedError;
}
