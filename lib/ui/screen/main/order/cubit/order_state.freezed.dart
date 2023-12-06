// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdate => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<OrderService> get services => throw _privateConstructorUsedError;
  OrderService? get serviceSelected => throw _privateConstructorUsedError;
  StepOrderType get stepOrderType => throw _privateConstructorUsedError;
  bool get pickupPoint => throw _privateConstructorUsedError;
  bool get deliveryPoint => throw _privateConstructorUsedError;
  bool get insurance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdate,
      String? error,
      List<OrderService> services,
      OrderService? serviceSelected,
      StepOrderType stepOrderType,
      bool pickupPoint,
      bool deliveryPoint,
      bool insurance});
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdate = null,
    Object? error = freezed,
    Object? services = null,
    Object? serviceSelected = freezed,
    Object? stepOrderType = null,
    Object? pickupPoint = null,
    Object? deliveryPoint = null,
    Object? insurance = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<OrderService>,
      serviceSelected: freezed == serviceSelected
          ? _value.serviceSelected
          : serviceSelected // ignore: cast_nullable_to_non_nullable
              as OrderService?,
      stepOrderType: null == stepOrderType
          ? _value.stepOrderType
          : stepOrderType // ignore: cast_nullable_to_non_nullable
              as StepOrderType,
      pickupPoint: null == pickupPoint
          ? _value.pickupPoint
          : pickupPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryPoint: null == deliveryPoint
          ? _value.deliveryPoint
          : deliveryPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      insurance: null == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
          _$OrderStateImpl value, $Res Function(_$OrderStateImpl) then) =
      __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdate,
      String? error,
      List<OrderService> services,
      OrderService? serviceSelected,
      StepOrderType stepOrderType,
      bool pickupPoint,
      bool deliveryPoint,
      bool insurance});
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
      _$OrderStateImpl _value, $Res Function(_$OrderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdate = null,
    Object? error = freezed,
    Object? services = null,
    Object? serviceSelected = freezed,
    Object? stepOrderType = null,
    Object? pickupPoint = null,
    Object? deliveryPoint = null,
    Object? insurance = null,
  }) {
    return _then(_$OrderStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<OrderService>,
      serviceSelected: freezed == serviceSelected
          ? _value.serviceSelected
          : serviceSelected // ignore: cast_nullable_to_non_nullable
              as OrderService?,
      stepOrderType: null == stepOrderType
          ? _value.stepOrderType
          : stepOrderType // ignore: cast_nullable_to_non_nullable
              as StepOrderType,
      pickupPoint: null == pickupPoint
          ? _value.pickupPoint
          : pickupPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryPoint: null == deliveryPoint
          ? _value.deliveryPoint
          : deliveryPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      insurance: null == insurance
          ? _value.insurance
          : insurance // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl(
      {required this.isLoading,
      required this.isUpdate,
      this.error,
      required final List<OrderService> services,
      this.serviceSelected,
      required this.stepOrderType,
      required this.pickupPoint,
      required this.deliveryPoint,
      required this.insurance})
      : _services = services;

  @override
  final bool isLoading;
  @override
  final bool isUpdate;
  @override
  final String? error;
  final List<OrderService> _services;
  @override
  List<OrderService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final OrderService? serviceSelected;
  @override
  final StepOrderType stepOrderType;
  @override
  final bool pickupPoint;
  @override
  final bool deliveryPoint;
  @override
  final bool insurance;

  @override
  String toString() {
    return 'OrderState(isLoading: $isLoading, isUpdate: $isUpdate, error: $error, services: $services, serviceSelected: $serviceSelected, stepOrderType: $stepOrderType, pickupPoint: $pickupPoint, deliveryPoint: $deliveryPoint, insurance: $insurance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.serviceSelected, serviceSelected) ||
                other.serviceSelected == serviceSelected) &&
            (identical(other.stepOrderType, stepOrderType) ||
                other.stepOrderType == stepOrderType) &&
            (identical(other.pickupPoint, pickupPoint) ||
                other.pickupPoint == pickupPoint) &&
            (identical(other.deliveryPoint, deliveryPoint) ||
                other.deliveryPoint == deliveryPoint) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isUpdate,
      error,
      const DeepCollectionEquality().hash(_services),
      serviceSelected,
      stepOrderType,
      pickupPoint,
      deliveryPoint,
      insurance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState implements OrderState {
  const factory _OrderState(
      {required final bool isLoading,
      required final bool isUpdate,
      final String? error,
      required final List<OrderService> services,
      final OrderService? serviceSelected,
      required final StepOrderType stepOrderType,
      required final bool pickupPoint,
      required final bool deliveryPoint,
      required final bool insurance}) = _$OrderStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isUpdate;
  @override
  String? get error;
  @override
  List<OrderService> get services;
  @override
  OrderService? get serviceSelected;
  @override
  StepOrderType get stepOrderType;
  @override
  bool get pickupPoint;
  @override
  bool get deliveryPoint;
  @override
  bool get insurance;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
