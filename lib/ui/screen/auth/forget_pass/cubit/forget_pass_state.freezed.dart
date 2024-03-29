// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_pass_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPassState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get showPass => throw _privateConstructorUsedError;
  bool get showConfirmPass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPassStateCopyWith<ForgetPassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPassStateCopyWith<$Res> {
  factory $ForgetPassStateCopyWith(
          ForgetPassState value, $Res Function(ForgetPassState) then) =
      _$ForgetPassStateCopyWithImpl<$Res, ForgetPassState>;
  @useResult
  $Res call(
      {bool isLoading, String error, bool showPass, bool showConfirmPass});
}

/// @nodoc
class _$ForgetPassStateCopyWithImpl<$Res, $Val extends ForgetPassState>
    implements $ForgetPassStateCopyWith<$Res> {
  _$ForgetPassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? showPass = null,
    Object? showConfirmPass = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      showPass: null == showPass
          ? _value.showPass
          : showPass // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPass: null == showConfirmPass
          ? _value.showConfirmPass
          : showConfirmPass // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgetPassStateImplCopyWith<$Res>
    implements $ForgetPassStateCopyWith<$Res> {
  factory _$$ForgetPassStateImplCopyWith(_$ForgetPassStateImpl value,
          $Res Function(_$ForgetPassStateImpl) then) =
      __$$ForgetPassStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, String error, bool showPass, bool showConfirmPass});
}

/// @nodoc
class __$$ForgetPassStateImplCopyWithImpl<$Res>
    extends _$ForgetPassStateCopyWithImpl<$Res, _$ForgetPassStateImpl>
    implements _$$ForgetPassStateImplCopyWith<$Res> {
  __$$ForgetPassStateImplCopyWithImpl(
      _$ForgetPassStateImpl _value, $Res Function(_$ForgetPassStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = null,
    Object? showPass = null,
    Object? showConfirmPass = null,
  }) {
    return _then(_$ForgetPassStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      showPass: null == showPass
          ? _value.showPass
          : showPass // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPass: null == showConfirmPass
          ? _value.showConfirmPass
          : showConfirmPass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ForgetPassStateImpl implements _ForgetPassState {
  const _$ForgetPassStateImpl(
      {required this.isLoading,
      required this.error,
      required this.showPass,
      required this.showConfirmPass});

  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final bool showPass;
  @override
  final bool showConfirmPass;

  @override
  String toString() {
    return 'ForgetPassState(isLoading: $isLoading, error: $error, showPass: $showPass, showConfirmPass: $showConfirmPass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPassStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.showPass, showPass) ||
                other.showPass == showPass) &&
            (identical(other.showConfirmPass, showConfirmPass) ||
                other.showConfirmPass == showConfirmPass));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, error, showPass, showConfirmPass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPassStateImplCopyWith<_$ForgetPassStateImpl> get copyWith =>
      __$$ForgetPassStateImplCopyWithImpl<_$ForgetPassStateImpl>(
          this, _$identity);
}

abstract class _ForgetPassState implements ForgetPassState {
  const factory _ForgetPassState(
      {required final bool isLoading,
      required final String error,
      required final bool showPass,
      required final bool showConfirmPass}) = _$ForgetPassStateImpl;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  bool get showPass;
  @override
  bool get showConfirmPass;
  @override
  @JsonKey(ignore: true)
  _$$ForgetPassStateImplCopyWith<_$ForgetPassStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
