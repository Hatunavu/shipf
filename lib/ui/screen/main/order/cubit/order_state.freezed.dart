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
  AddressDataResponse? get addressPick => throw _privateConstructorUsedError;
  AddressDataResponse? get addressDeliver =>
      throw _privateConstructorUsedError; //location
  String get errorProvince => throw _privateConstructorUsedError;
  String get errorDistrict => throw _privateConstructorUsedError;
  String get errorWard => throw _privateConstructorUsedError;
  bool? get isLoadingDistrict => throw _privateConstructorUsedError;
  bool? get isLoadingWard => throw _privateConstructorUsedError;
  List<AddressDataModel>? get provinces => throw _privateConstructorUsedError;
  List<AddressDataModel>? get districts => throw _privateConstructorUsedError;
  List<AddressDataModel>? get wards => throw _privateConstructorUsedError;
  AddressDataModel? get province => throw _privateConstructorUsedError;
  AddressDataModel? get district => throw _privateConstructorUsedError;
  AddressDataModel? get ward => throw _privateConstructorUsedError;
  String get errorProvinceDeliver => throw _privateConstructorUsedError;
  String get errorDistrictDeliver => throw _privateConstructorUsedError;
  String get errorWardDeliver => throw _privateConstructorUsedError;
  bool? get isLoadingDistrictDeliver => throw _privateConstructorUsedError;
  bool? get isLoadingWardDeliver => throw _privateConstructorUsedError;
  List<AddressDataModel>? get provincesDeliver =>
      throw _privateConstructorUsedError;
  List<AddressDataModel>? get districtsDeliver =>
      throw _privateConstructorUsedError;
  List<AddressDataModel>? get wardsDeliver =>
      throw _privateConstructorUsedError;
  AddressDataModel? get provinceDeliver => throw _privateConstructorUsedError;
  AddressDataModel? get districtDeliver => throw _privateConstructorUsedError;
  AddressDataModel? get wardDeliver => throw _privateConstructorUsedError;

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
      bool insurance,
      AddressDataResponse? addressPick,
      AddressDataResponse? addressDeliver,
      String errorProvince,
      String errorDistrict,
      String errorWard,
      bool? isLoadingDistrict,
      bool? isLoadingWard,
      List<AddressDataModel>? provinces,
      List<AddressDataModel>? districts,
      List<AddressDataModel>? wards,
      AddressDataModel? province,
      AddressDataModel? district,
      AddressDataModel? ward,
      String errorProvinceDeliver,
      String errorDistrictDeliver,
      String errorWardDeliver,
      bool? isLoadingDistrictDeliver,
      bool? isLoadingWardDeliver,
      List<AddressDataModel>? provincesDeliver,
      List<AddressDataModel>? districtsDeliver,
      List<AddressDataModel>? wardsDeliver,
      AddressDataModel? provinceDeliver,
      AddressDataModel? districtDeliver,
      AddressDataModel? wardDeliver});
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
    Object? addressPick = freezed,
    Object? addressDeliver = freezed,
    Object? errorProvince = null,
    Object? errorDistrict = null,
    Object? errorWard = null,
    Object? isLoadingDistrict = freezed,
    Object? isLoadingWard = freezed,
    Object? provinces = freezed,
    Object? districts = freezed,
    Object? wards = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
    Object? errorProvinceDeliver = null,
    Object? errorDistrictDeliver = null,
    Object? errorWardDeliver = null,
    Object? isLoadingDistrictDeliver = freezed,
    Object? isLoadingWardDeliver = freezed,
    Object? provincesDeliver = freezed,
    Object? districtsDeliver = freezed,
    Object? wardsDeliver = freezed,
    Object? provinceDeliver = freezed,
    Object? districtDeliver = freezed,
    Object? wardDeliver = freezed,
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
      addressPick: freezed == addressPick
          ? _value.addressPick
          : addressPick // ignore: cast_nullable_to_non_nullable
              as AddressDataResponse?,
      addressDeliver: freezed == addressDeliver
          ? _value.addressDeliver
          : addressDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataResponse?,
      errorProvince: null == errorProvince
          ? _value.errorProvince
          : errorProvince // ignore: cast_nullable_to_non_nullable
              as String,
      errorDistrict: null == errorDistrict
          ? _value.errorDistrict
          : errorDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      errorWard: null == errorWard
          ? _value.errorWard
          : errorWard // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingDistrict: freezed == isLoadingDistrict
          ? _value.isLoadingDistrict
          : isLoadingDistrict // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadingWard: freezed == isLoadingWard
          ? _value.isLoadingWard
          : isLoadingWard // ignore: cast_nullable_to_non_nullable
              as bool?,
      provinces: freezed == provinces
          ? _value.provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      districts: freezed == districts
          ? _value.districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      wards: freezed == wards
          ? _value.wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      errorProvinceDeliver: null == errorProvinceDeliver
          ? _value.errorProvinceDeliver
          : errorProvinceDeliver // ignore: cast_nullable_to_non_nullable
              as String,
      errorDistrictDeliver: null == errorDistrictDeliver
          ? _value.errorDistrictDeliver
          : errorDistrictDeliver // ignore: cast_nullable_to_non_nullable
              as String,
      errorWardDeliver: null == errorWardDeliver
          ? _value.errorWardDeliver
          : errorWardDeliver // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingDistrictDeliver: freezed == isLoadingDistrictDeliver
          ? _value.isLoadingDistrictDeliver
          : isLoadingDistrictDeliver // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadingWardDeliver: freezed == isLoadingWardDeliver
          ? _value.isLoadingWardDeliver
          : isLoadingWardDeliver // ignore: cast_nullable_to_non_nullable
              as bool?,
      provincesDeliver: freezed == provincesDeliver
          ? _value.provincesDeliver
          : provincesDeliver // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      districtsDeliver: freezed == districtsDeliver
          ? _value.districtsDeliver
          : districtsDeliver // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      wardsDeliver: freezed == wardsDeliver
          ? _value.wardsDeliver
          : wardsDeliver // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      provinceDeliver: freezed == provinceDeliver
          ? _value.provinceDeliver
          : provinceDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      districtDeliver: freezed == districtDeliver
          ? _value.districtDeliver
          : districtDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      wardDeliver: freezed == wardDeliver
          ? _value.wardDeliver
          : wardDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderStateCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$_OrderStateCopyWith(
          _$_OrderState value, $Res Function(_$_OrderState) then) =
      __$$_OrderStateCopyWithImpl<$Res>;
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
      bool insurance,
      AddressDataResponse? addressPick,
      AddressDataResponse? addressDeliver,
      String errorProvince,
      String errorDistrict,
      String errorWard,
      bool? isLoadingDistrict,
      bool? isLoadingWard,
      List<AddressDataModel>? provinces,
      List<AddressDataModel>? districts,
      List<AddressDataModel>? wards,
      AddressDataModel? province,
      AddressDataModel? district,
      AddressDataModel? ward,
      String errorProvinceDeliver,
      String errorDistrictDeliver,
      String errorWardDeliver,
      bool? isLoadingDistrictDeliver,
      bool? isLoadingWardDeliver,
      List<AddressDataModel>? provincesDeliver,
      List<AddressDataModel>? districtsDeliver,
      List<AddressDataModel>? wardsDeliver,
      AddressDataModel? provinceDeliver,
      AddressDataModel? districtDeliver,
      AddressDataModel? wardDeliver});
}

/// @nodoc
class __$$_OrderStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$_OrderState>
    implements _$$_OrderStateCopyWith<$Res> {
  __$$_OrderStateCopyWithImpl(
      _$_OrderState _value, $Res Function(_$_OrderState) _then)
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
    Object? addressPick = freezed,
    Object? addressDeliver = freezed,
    Object? errorProvince = null,
    Object? errorDistrict = null,
    Object? errorWard = null,
    Object? isLoadingDistrict = freezed,
    Object? isLoadingWard = freezed,
    Object? provinces = freezed,
    Object? districts = freezed,
    Object? wards = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? ward = freezed,
    Object? errorProvinceDeliver = null,
    Object? errorDistrictDeliver = null,
    Object? errorWardDeliver = null,
    Object? isLoadingDistrictDeliver = freezed,
    Object? isLoadingWardDeliver = freezed,
    Object? provincesDeliver = freezed,
    Object? districtsDeliver = freezed,
    Object? wardsDeliver = freezed,
    Object? provinceDeliver = freezed,
    Object? districtDeliver = freezed,
    Object? wardDeliver = freezed,
  }) {
    return _then(_$_OrderState(
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
      addressPick: freezed == addressPick
          ? _value.addressPick
          : addressPick // ignore: cast_nullable_to_non_nullable
              as AddressDataResponse?,
      addressDeliver: freezed == addressDeliver
          ? _value.addressDeliver
          : addressDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataResponse?,
      errorProvince: null == errorProvince
          ? _value.errorProvince
          : errorProvince // ignore: cast_nullable_to_non_nullable
              as String,
      errorDistrict: null == errorDistrict
          ? _value.errorDistrict
          : errorDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      errorWard: null == errorWard
          ? _value.errorWard
          : errorWard // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingDistrict: freezed == isLoadingDistrict
          ? _value.isLoadingDistrict
          : isLoadingDistrict // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadingWard: freezed == isLoadingWard
          ? _value.isLoadingWard
          : isLoadingWard // ignore: cast_nullable_to_non_nullable
              as bool?,
      provinces: freezed == provinces
          ? _value._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      districts: freezed == districts
          ? _value._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      wards: freezed == wards
          ? _value._wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      errorProvinceDeliver: null == errorProvinceDeliver
          ? _value.errorProvinceDeliver
          : errorProvinceDeliver // ignore: cast_nullable_to_non_nullable
              as String,
      errorDistrictDeliver: null == errorDistrictDeliver
          ? _value.errorDistrictDeliver
          : errorDistrictDeliver // ignore: cast_nullable_to_non_nullable
              as String,
      errorWardDeliver: null == errorWardDeliver
          ? _value.errorWardDeliver
          : errorWardDeliver // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingDistrictDeliver: freezed == isLoadingDistrictDeliver
          ? _value.isLoadingDistrictDeliver
          : isLoadingDistrictDeliver // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoadingWardDeliver: freezed == isLoadingWardDeliver
          ? _value.isLoadingWardDeliver
          : isLoadingWardDeliver // ignore: cast_nullable_to_non_nullable
              as bool?,
      provincesDeliver: freezed == provincesDeliver
          ? _value._provincesDeliver
          : provincesDeliver // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      districtsDeliver: freezed == districtsDeliver
          ? _value._districtsDeliver
          : districtsDeliver // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      wardsDeliver: freezed == wardsDeliver
          ? _value._wardsDeliver
          : wardsDeliver // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>?,
      provinceDeliver: freezed == provinceDeliver
          ? _value.provinceDeliver
          : provinceDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      districtDeliver: freezed == districtDeliver
          ? _value.districtDeliver
          : districtDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      wardDeliver: freezed == wardDeliver
          ? _value.wardDeliver
          : wardDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
    ));
  }
}

/// @nodoc

class _$_OrderState implements _OrderState {
  const _$_OrderState(
      {required this.isLoading,
      required this.isUpdate,
      this.error,
      required final List<OrderService> services,
      this.serviceSelected,
      required this.stepOrderType,
      required this.pickupPoint,
      required this.deliveryPoint,
      required this.insurance,
      this.addressPick,
      this.addressDeliver,
      required this.errorProvince,
      required this.errorDistrict,
      required this.errorWard,
      this.isLoadingDistrict,
      this.isLoadingWard,
      final List<AddressDataModel>? provinces,
      final List<AddressDataModel>? districts,
      final List<AddressDataModel>? wards,
      this.province,
      this.district,
      this.ward,
      required this.errorProvinceDeliver,
      required this.errorDistrictDeliver,
      required this.errorWardDeliver,
      this.isLoadingDistrictDeliver,
      this.isLoadingWardDeliver,
      final List<AddressDataModel>? provincesDeliver,
      final List<AddressDataModel>? districtsDeliver,
      final List<AddressDataModel>? wardsDeliver,
      this.provinceDeliver,
      this.districtDeliver,
      this.wardDeliver})
      : _services = services,
        _provinces = provinces,
        _districts = districts,
        _wards = wards,
        _provincesDeliver = provincesDeliver,
        _districtsDeliver = districtsDeliver,
        _wardsDeliver = wardsDeliver;

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
  final AddressDataResponse? addressPick;
  @override
  final AddressDataResponse? addressDeliver;
//location
  @override
  final String errorProvince;
  @override
  final String errorDistrict;
  @override
  final String errorWard;
  @override
  final bool? isLoadingDistrict;
  @override
  final bool? isLoadingWard;
  final List<AddressDataModel>? _provinces;
  @override
  List<AddressDataModel>? get provinces {
    final value = _provinces;
    if (value == null) return null;
    if (_provinces is EqualUnmodifiableListView) return _provinces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AddressDataModel>? _districts;
  @override
  List<AddressDataModel>? get districts {
    final value = _districts;
    if (value == null) return null;
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AddressDataModel>? _wards;
  @override
  List<AddressDataModel>? get wards {
    final value = _wards;
    if (value == null) return null;
    if (_wards is EqualUnmodifiableListView) return _wards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AddressDataModel? province;
  @override
  final AddressDataModel? district;
  @override
  final AddressDataModel? ward;
  @override
  final String errorProvinceDeliver;
  @override
  final String errorDistrictDeliver;
  @override
  final String errorWardDeliver;
  @override
  final bool? isLoadingDistrictDeliver;
  @override
  final bool? isLoadingWardDeliver;
  final List<AddressDataModel>? _provincesDeliver;
  @override
  List<AddressDataModel>? get provincesDeliver {
    final value = _provincesDeliver;
    if (value == null) return null;
    if (_provincesDeliver is EqualUnmodifiableListView)
      return _provincesDeliver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AddressDataModel>? _districtsDeliver;
  @override
  List<AddressDataModel>? get districtsDeliver {
    final value = _districtsDeliver;
    if (value == null) return null;
    if (_districtsDeliver is EqualUnmodifiableListView)
      return _districtsDeliver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AddressDataModel>? _wardsDeliver;
  @override
  List<AddressDataModel>? get wardsDeliver {
    final value = _wardsDeliver;
    if (value == null) return null;
    if (_wardsDeliver is EqualUnmodifiableListView) return _wardsDeliver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AddressDataModel? provinceDeliver;
  @override
  final AddressDataModel? districtDeliver;
  @override
  final AddressDataModel? wardDeliver;

  @override
  String toString() {
    return 'OrderState(isLoading: $isLoading, isUpdate: $isUpdate, error: $error, services: $services, serviceSelected: $serviceSelected, stepOrderType: $stepOrderType, pickupPoint: $pickupPoint, deliveryPoint: $deliveryPoint, insurance: $insurance, addressPick: $addressPick, addressDeliver: $addressDeliver, errorProvince: $errorProvince, errorDistrict: $errorDistrict, errorWard: $errorWard, isLoadingDistrict: $isLoadingDistrict, isLoadingWard: $isLoadingWard, provinces: $provinces, districts: $districts, wards: $wards, province: $province, district: $district, ward: $ward, errorProvinceDeliver: $errorProvinceDeliver, errorDistrictDeliver: $errorDistrictDeliver, errorWardDeliver: $errorWardDeliver, isLoadingDistrictDeliver: $isLoadingDistrictDeliver, isLoadingWardDeliver: $isLoadingWardDeliver, provincesDeliver: $provincesDeliver, districtsDeliver: $districtsDeliver, wardsDeliver: $wardsDeliver, provinceDeliver: $provinceDeliver, districtDeliver: $districtDeliver, wardDeliver: $wardDeliver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderState &&
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
                other.insurance == insurance) &&
            (identical(other.addressPick, addressPick) ||
                other.addressPick == addressPick) &&
            (identical(other.addressDeliver, addressDeliver) ||
                other.addressDeliver == addressDeliver) &&
            (identical(other.errorProvince, errorProvince) ||
                other.errorProvince == errorProvince) &&
            (identical(other.errorDistrict, errorDistrict) ||
                other.errorDistrict == errorDistrict) &&
            (identical(other.errorWard, errorWard) ||
                other.errorWard == errorWard) &&
            (identical(other.isLoadingDistrict, isLoadingDistrict) ||
                other.isLoadingDistrict == isLoadingDistrict) &&
            (identical(other.isLoadingWard, isLoadingWard) ||
                other.isLoadingWard == isLoadingWard) &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces) &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts) &&
            const DeepCollectionEquality().equals(other._wards, _wards) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.ward, ward) || other.ward == ward) &&
            (identical(other.errorProvinceDeliver, errorProvinceDeliver) ||
                other.errorProvinceDeliver == errorProvinceDeliver) &&
            (identical(other.errorDistrictDeliver, errorDistrictDeliver) ||
                other.errorDistrictDeliver == errorDistrictDeliver) &&
            (identical(other.errorWardDeliver, errorWardDeliver) ||
                other.errorWardDeliver == errorWardDeliver) &&
            (identical(
                    other.isLoadingDistrictDeliver, isLoadingDistrictDeliver) ||
                other.isLoadingDistrictDeliver == isLoadingDistrictDeliver) &&
            (identical(other.isLoadingWardDeliver, isLoadingWardDeliver) ||
                other.isLoadingWardDeliver == isLoadingWardDeliver) &&
            const DeepCollectionEquality()
                .equals(other._provincesDeliver, _provincesDeliver) &&
            const DeepCollectionEquality()
                .equals(other._districtsDeliver, _districtsDeliver) &&
            const DeepCollectionEquality()
                .equals(other._wardsDeliver, _wardsDeliver) &&
            (identical(other.provinceDeliver, provinceDeliver) ||
                other.provinceDeliver == provinceDeliver) &&
            (identical(other.districtDeliver, districtDeliver) ||
                other.districtDeliver == districtDeliver) &&
            (identical(other.wardDeliver, wardDeliver) ||
                other.wardDeliver == wardDeliver));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isUpdate,
        error,
        const DeepCollectionEquality().hash(_services),
        serviceSelected,
        stepOrderType,
        pickupPoint,
        deliveryPoint,
        insurance,
        addressPick,
        addressDeliver,
        errorProvince,
        errorDistrict,
        errorWard,
        isLoadingDistrict,
        isLoadingWard,
        const DeepCollectionEquality().hash(_provinces),
        const DeepCollectionEquality().hash(_districts),
        const DeepCollectionEquality().hash(_wards),
        province,
        district,
        ward,
        errorProvinceDeliver,
        errorDistrictDeliver,
        errorWardDeliver,
        isLoadingDistrictDeliver,
        isLoadingWardDeliver,
        const DeepCollectionEquality().hash(_provincesDeliver),
        const DeepCollectionEquality().hash(_districtsDeliver),
        const DeepCollectionEquality().hash(_wardsDeliver),
        provinceDeliver,
        districtDeliver,
        wardDeliver
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderStateCopyWith<_$_OrderState> get copyWith =>
      __$$_OrderStateCopyWithImpl<_$_OrderState>(this, _$identity);
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
      required final bool insurance,
      final AddressDataResponse? addressPick,
      final AddressDataResponse? addressDeliver,
      required final String errorProvince,
      required final String errorDistrict,
      required final String errorWard,
      final bool? isLoadingDistrict,
      final bool? isLoadingWard,
      final List<AddressDataModel>? provinces,
      final List<AddressDataModel>? districts,
      final List<AddressDataModel>? wards,
      final AddressDataModel? province,
      final AddressDataModel? district,
      final AddressDataModel? ward,
      required final String errorProvinceDeliver,
      required final String errorDistrictDeliver,
      required final String errorWardDeliver,
      final bool? isLoadingDistrictDeliver,
      final bool? isLoadingWardDeliver,
      final List<AddressDataModel>? provincesDeliver,
      final List<AddressDataModel>? districtsDeliver,
      final List<AddressDataModel>? wardsDeliver,
      final AddressDataModel? provinceDeliver,
      final AddressDataModel? districtDeliver,
      final AddressDataModel? wardDeliver}) = _$_OrderState;

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
  AddressDataResponse? get addressPick;
  @override
  AddressDataResponse? get addressDeliver;
  @override //location
  String get errorProvince;
  @override
  String get errorDistrict;
  @override
  String get errorWard;
  @override
  bool? get isLoadingDistrict;
  @override
  bool? get isLoadingWard;
  @override
  List<AddressDataModel>? get provinces;
  @override
  List<AddressDataModel>? get districts;
  @override
  List<AddressDataModel>? get wards;
  @override
  AddressDataModel? get province;
  @override
  AddressDataModel? get district;
  @override
  AddressDataModel? get ward;
  @override
  String get errorProvinceDeliver;
  @override
  String get errorDistrictDeliver;
  @override
  String get errorWardDeliver;
  @override
  bool? get isLoadingDistrictDeliver;
  @override
  bool? get isLoadingWardDeliver;
  @override
  List<AddressDataModel>? get provincesDeliver;
  @override
  List<AddressDataModel>? get districtsDeliver;
  @override
  List<AddressDataModel>? get wardsDeliver;
  @override
  AddressDataModel? get provinceDeliver;
  @override
  AddressDataModel? get districtDeliver;
  @override
  AddressDataModel? get wardDeliver;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStateCopyWith<_$_OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
