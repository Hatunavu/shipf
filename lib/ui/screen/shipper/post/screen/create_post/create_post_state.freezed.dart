// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatePostState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFirstLoad => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<AddressDataModel> get provinces => throw _privateConstructorUsedError;
  AddressDataModel? get province => throw _privateConstructorUsedError;
  AddressDataModel? get provinceDeliver => throw _privateConstructorUsedError;
  String get errorProvince => throw _privateConstructorUsedError;
  String get errorProvinceDeliver => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePostStateCopyWith<CreatePostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostStateCopyWith<$Res> {
  factory $CreatePostStateCopyWith(
          CreatePostState value, $Res Function(CreatePostState) then) =
      _$CreatePostStateCopyWithImpl<$Res, CreatePostState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      List<AddressDataModel> provinces,
      AddressDataModel? province,
      AddressDataModel? provinceDeliver,
      String errorProvince,
      String errorProvinceDeliver});
}

/// @nodoc
class _$CreatePostStateCopyWithImpl<$Res, $Val extends CreatePostState>
    implements $CreatePostStateCopyWith<$Res> {
  _$CreatePostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstLoad = null,
    Object? error = freezed,
    Object? provinces = null,
    Object? province = freezed,
    Object? provinceDeliver = freezed,
    Object? errorProvince = null,
    Object? errorProvinceDeliver = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      provinces: null == provinces
          ? _value.provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      provinceDeliver: freezed == provinceDeliver
          ? _value.provinceDeliver
          : provinceDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      errorProvince: null == errorProvince
          ? _value.errorProvince
          : errorProvince // ignore: cast_nullable_to_non_nullable
              as String,
      errorProvinceDeliver: null == errorProvinceDeliver
          ? _value.errorProvinceDeliver
          : errorProvinceDeliver // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePostStateImplCopyWith<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  factory _$$CreatePostStateImplCopyWith(_$CreatePostStateImpl value,
          $Res Function(_$CreatePostStateImpl) then) =
      __$$CreatePostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      List<AddressDataModel> provinces,
      AddressDataModel? province,
      AddressDataModel? provinceDeliver,
      String errorProvince,
      String errorProvinceDeliver});
}

/// @nodoc
class __$$CreatePostStateImplCopyWithImpl<$Res>
    extends _$CreatePostStateCopyWithImpl<$Res, _$CreatePostStateImpl>
    implements _$$CreatePostStateImplCopyWith<$Res> {
  __$$CreatePostStateImplCopyWithImpl(
      _$CreatePostStateImpl _value, $Res Function(_$CreatePostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstLoad = null,
    Object? error = freezed,
    Object? provinces = null,
    Object? province = freezed,
    Object? provinceDeliver = freezed,
    Object? errorProvince = null,
    Object? errorProvinceDeliver = null,
  }) {
    return _then(_$CreatePostStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      provinces: null == provinces
          ? _value._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<AddressDataModel>,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      provinceDeliver: freezed == provinceDeliver
          ? _value.provinceDeliver
          : provinceDeliver // ignore: cast_nullable_to_non_nullable
              as AddressDataModel?,
      errorProvince: null == errorProvince
          ? _value.errorProvince
          : errorProvince // ignore: cast_nullable_to_non_nullable
              as String,
      errorProvinceDeliver: null == errorProvinceDeliver
          ? _value.errorProvinceDeliver
          : errorProvinceDeliver // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreatePostStateImpl implements _CreatePostState {
  const _$CreatePostStateImpl(
      {required this.isLoading,
      required this.isFirstLoad,
      this.error,
      required final List<AddressDataModel> provinces,
      this.province,
      this.provinceDeliver,
      required this.errorProvince,
      required this.errorProvinceDeliver})
      : _provinces = provinces;

  @override
  final bool isLoading;
  @override
  final bool isFirstLoad;
  @override
  final String? error;
  final List<AddressDataModel> _provinces;
  @override
  List<AddressDataModel> get provinces {
    if (_provinces is EqualUnmodifiableListView) return _provinces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_provinces);
  }

  @override
  final AddressDataModel? province;
  @override
  final AddressDataModel? provinceDeliver;
  @override
  final String errorProvince;
  @override
  final String errorProvinceDeliver;

  @override
  String toString() {
    return 'CreatePostState(isLoading: $isLoading, isFirstLoad: $isFirstLoad, error: $error, provinces: $provinces, province: $province, provinceDeliver: $provinceDeliver, errorProvince: $errorProvince, errorProvinceDeliver: $errorProvinceDeliver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFirstLoad, isFirstLoad) ||
                other.isFirstLoad == isFirstLoad) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.provinceDeliver, provinceDeliver) ||
                other.provinceDeliver == provinceDeliver) &&
            (identical(other.errorProvince, errorProvince) ||
                other.errorProvince == errorProvince) &&
            (identical(other.errorProvinceDeliver, errorProvinceDeliver) ||
                other.errorProvinceDeliver == errorProvinceDeliver));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isFirstLoad,
      error,
      const DeepCollectionEquality().hash(_provinces),
      province,
      provinceDeliver,
      errorProvince,
      errorProvinceDeliver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostStateImplCopyWith<_$CreatePostStateImpl> get copyWith =>
      __$$CreatePostStateImplCopyWithImpl<_$CreatePostStateImpl>(
          this, _$identity);
}

abstract class _CreatePostState implements CreatePostState {
  const factory _CreatePostState(
      {required final bool isLoading,
      required final bool isFirstLoad,
      final String? error,
      required final List<AddressDataModel> provinces,
      final AddressDataModel? province,
      final AddressDataModel? provinceDeliver,
      required final String errorProvince,
      required final String errorProvinceDeliver}) = _$CreatePostStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isFirstLoad;
  @override
  String? get error;
  @override
  List<AddressDataModel> get provinces;
  @override
  AddressDataModel? get province;
  @override
  AddressDataModel? get provinceDeliver;
  @override
  String get errorProvince;
  @override
  String get errorProvinceDeliver;
  @override
  @JsonKey(ignore: true)
  _$$CreatePostStateImplCopyWith<_$CreatePostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
