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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeShipperState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<int> get analysis => throw _privateConstructorUsedError;

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
  $Res call({bool isLoading, String? error, List<int> analysis});
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
    Object? analysis = null,
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
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeShipperStateImplCopyWith<$Res>
    implements $HomeShipperStateCopyWith<$Res> {
  factory _$$HomeShipperStateImplCopyWith(_$HomeShipperStateImpl value,
          $Res Function(_$HomeShipperStateImpl) then) =
      __$$HomeShipperStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, List<int> analysis});
}

/// @nodoc
class __$$HomeShipperStateImplCopyWithImpl<$Res>
    extends _$HomeShipperStateCopyWithImpl<$Res, _$HomeShipperStateImpl>
    implements _$$HomeShipperStateImplCopyWith<$Res> {
  __$$HomeShipperStateImplCopyWithImpl(_$HomeShipperStateImpl _value,
      $Res Function(_$HomeShipperStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? analysis = null,
  }) {
    return _then(_$HomeShipperStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      analysis: null == analysis
          ? _value._analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$HomeShipperStateImpl implements _HomeShipperState {
  const _$HomeShipperStateImpl(
      {required this.isLoading, this.error, required final List<int> analysis})
      : _analysis = analysis;

  @override
  final bool isLoading;
  @override
  final String? error;
  final List<int> _analysis;
  @override
  List<int> get analysis {
    if (_analysis is EqualUnmodifiableListView) return _analysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysis);
  }

  @override
  String toString() {
    return 'HomeShipperState(isLoading: $isLoading, error: $error, analysis: $analysis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeShipperStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._analysis, _analysis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_analysis));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeShipperStateImplCopyWith<_$HomeShipperStateImpl> get copyWith =>
      __$$HomeShipperStateImplCopyWithImpl<_$HomeShipperStateImpl>(
          this, _$identity);
}

abstract class _HomeShipperState implements HomeShipperState {
  const factory _HomeShipperState(
      {required final bool isLoading,
      final String? error,
      required final List<int> analysis}) = _$HomeShipperStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  List<int> get analysis;
  @override
  @JsonKey(ignore: true)
  _$$HomeShipperStateImplCopyWith<_$HomeShipperStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
