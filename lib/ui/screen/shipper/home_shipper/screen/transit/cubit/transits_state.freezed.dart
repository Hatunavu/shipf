// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transits_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransitsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<TransitData> get listTransitData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransitsStateCopyWith<TransitsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransitsStateCopyWith<$Res> {
  factory $TransitsStateCopyWith(
          TransitsState value, $Res Function(TransitsState) then) =
      _$TransitsStateCopyWithImpl<$Res, TransitsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      String? error,
      List<TransitData> listTransitData});
}

/// @nodoc
class _$TransitsStateCopyWithImpl<$Res, $Val extends TransitsState>
    implements $TransitsStateCopyWith<$Res> {
  _$TransitsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? error = freezed,
    Object? listTransitData = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      listTransitData: null == listTransitData
          ? _value.listTransitData
          : listTransitData // ignore: cast_nullable_to_non_nullable
              as List<TransitData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransitsStateImplCopyWith<$Res>
    implements $TransitsStateCopyWith<$Res> {
  factory _$$TransitsStateImplCopyWith(
          _$TransitsStateImpl value, $Res Function(_$TransitsStateImpl) then) =
      __$$TransitsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdating,
      String? error,
      List<TransitData> listTransitData});
}

/// @nodoc
class __$$TransitsStateImplCopyWithImpl<$Res>
    extends _$TransitsStateCopyWithImpl<$Res, _$TransitsStateImpl>
    implements _$$TransitsStateImplCopyWith<$Res> {
  __$$TransitsStateImplCopyWithImpl(
      _$TransitsStateImpl _value, $Res Function(_$TransitsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? error = freezed,
    Object? listTransitData = null,
  }) {
    return _then(_$TransitsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      listTransitData: null == listTransitData
          ? _value._listTransitData
          : listTransitData // ignore: cast_nullable_to_non_nullable
              as List<TransitData>,
    ));
  }
}

/// @nodoc

class _$TransitsStateImpl implements _TransitsState {
  const _$TransitsStateImpl(
      {required this.isLoading,
      required this.isUpdating,
      this.error,
      required final List<TransitData> listTransitData})
      : _listTransitData = listTransitData;

  @override
  final bool isLoading;
  @override
  final bool isUpdating;
  @override
  final String? error;
  final List<TransitData> _listTransitData;
  @override
  List<TransitData> get listTransitData {
    if (_listTransitData is EqualUnmodifiableListView) return _listTransitData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTransitData);
  }

  @override
  String toString() {
    return 'TransitsState(isLoading: $isLoading, isUpdating: $isUpdating, error: $error, listTransitData: $listTransitData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransitsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._listTransitData, _listTransitData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isUpdating, error,
      const DeepCollectionEquality().hash(_listTransitData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransitsStateImplCopyWith<_$TransitsStateImpl> get copyWith =>
      __$$TransitsStateImplCopyWithImpl<_$TransitsStateImpl>(this, _$identity);
}

abstract class _TransitsState implements TransitsState {
  const factory _TransitsState(
      {required final bool isLoading,
      required final bool isUpdating,
      final String? error,
      required final List<TransitData> listTransitData}) = _$TransitsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  String? get error;
  @override
  List<TransitData> get listTransitData;
  @override
  @JsonKey(ignore: true)
  _$$TransitsStateImplCopyWith<_$TransitsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
