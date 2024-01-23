// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transit_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransitDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransitDetailStateCopyWith<TransitDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransitDetailStateCopyWith<$Res> {
  factory $TransitDetailStateCopyWith(
          TransitDetailState value, $Res Function(TransitDetailState) then) =
      _$TransitDetailStateCopyWithImpl<$Res, TransitDetailState>;
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class _$TransitDetailStateCopyWithImpl<$Res, $Val extends TransitDetailState>
    implements $TransitDetailStateCopyWith<$Res> {
  _$TransitDetailStateCopyWithImpl(this._value, this._then);

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
abstract class _$$TransitDetailStateImplCopyWith<$Res>
    implements $TransitDetailStateCopyWith<$Res> {
  factory _$$TransitDetailStateImplCopyWith(_$TransitDetailStateImpl value,
          $Res Function(_$TransitDetailStateImpl) then) =
      __$$TransitDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error});
}

/// @nodoc
class __$$TransitDetailStateImplCopyWithImpl<$Res>
    extends _$TransitDetailStateCopyWithImpl<$Res, _$TransitDetailStateImpl>
    implements _$$TransitDetailStateImplCopyWith<$Res> {
  __$$TransitDetailStateImplCopyWithImpl(_$TransitDetailStateImpl _value,
      $Res Function(_$TransitDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$TransitDetailStateImpl(
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

class _$TransitDetailStateImpl implements _TransitDetailState {
  const _$TransitDetailStateImpl({required this.isLoading, this.error});

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'TransitDetailState(isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransitDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransitDetailStateImplCopyWith<_$TransitDetailStateImpl> get copyWith =>
      __$$TransitDetailStateImplCopyWithImpl<_$TransitDetailStateImpl>(
          this, _$identity);
}

abstract class _TransitDetailState implements TransitDetailState {
  const factory _TransitDetailState(
      {required final bool isLoading,
      final String? error}) = _$TransitDetailStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$TransitDetailStateImplCopyWith<_$TransitDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
