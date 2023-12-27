// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BillState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<ListOrderData> get listOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillStateCopyWith<BillState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillStateCopyWith<$Res> {
  factory $BillStateCopyWith(BillState value, $Res Function(BillState) then) =
      _$BillStateCopyWithImpl<$Res, BillState>;
  @useResult
  $Res call({bool isLoading, String? error, List<ListOrderData> listOrder});
}

/// @nodoc
class _$BillStateCopyWithImpl<$Res, $Val extends BillState>
    implements $BillStateCopyWith<$Res> {
  _$BillStateCopyWithImpl(this._value, this._then);

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
              as List<ListOrderData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillStateImplCopyWith<$Res>
    implements $BillStateCopyWith<$Res> {
  factory _$$BillStateImplCopyWith(
          _$BillStateImpl value, $Res Function(_$BillStateImpl) then) =
      __$$BillStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, List<ListOrderData> listOrder});
}

/// @nodoc
class __$$BillStateImplCopyWithImpl<$Res>
    extends _$BillStateCopyWithImpl<$Res, _$BillStateImpl>
    implements _$$BillStateImplCopyWith<$Res> {
  __$$BillStateImplCopyWithImpl(
      _$BillStateImpl _value, $Res Function(_$BillStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? listOrder = null,
  }) {
    return _then(_$BillStateImpl(
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
              as List<ListOrderData>,
    ));
  }
}

/// @nodoc

class _$BillStateImpl implements _BillState {
  const _$BillStateImpl(
      {required this.isLoading,
      this.error,
      required final List<ListOrderData> listOrder})
      : _listOrder = listOrder;

  @override
  final bool isLoading;
  @override
  final String? error;
  final List<ListOrderData> _listOrder;
  @override
  List<ListOrderData> get listOrder {
    if (_listOrder is EqualUnmodifiableListView) return _listOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOrder);
  }

  @override
  String toString() {
    return 'BillState(isLoading: $isLoading, error: $error, listOrder: $listOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillStateImpl &&
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
  _$$BillStateImplCopyWith<_$BillStateImpl> get copyWith =>
      __$$BillStateImplCopyWithImpl<_$BillStateImpl>(this, _$identity);
}

abstract class _BillState implements BillState {
  const factory _BillState(
      {required final bool isLoading,
      final String? error,
      required final List<ListOrderData> listOrder}) = _$BillStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  List<ListOrderData> get listOrder;
  @override
  @JsonKey(ignore: true)
  _$$BillStateImplCopyWith<_$BillStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
