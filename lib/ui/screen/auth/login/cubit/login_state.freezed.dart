// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  RoleType get role => throw _privateConstructorUsedError;
  bool get isAgreeTerms => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get showPass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isLoading,
      RoleType role,
      bool isAgreeTerms,
      bool isLogin,
      String error,
      bool showPass});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? role = null,
    Object? isAgreeTerms = null,
    Object? isLogin = null,
    Object? error = null,
    Object? showPass = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleType,
      isAgreeTerms: null == isAgreeTerms
          ? _value.isAgreeTerms
          : isAgreeTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      showPass: null == showPass
          ? _value.showPass
          : showPass // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      RoleType role,
      bool isAgreeTerms,
      bool isLogin,
      String error,
      bool showPass});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? role = null,
    Object? isAgreeTerms = null,
    Object? isLogin = null,
    Object? error = null,
    Object? showPass = null,
  }) {
    return _then(_$_LoginState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleType,
      isAgreeTerms: null == isAgreeTerms
          ? _value.isAgreeTerms
          : isAgreeTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      showPass: null == showPass
          ? _value.showPass
          : showPass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {required this.isLoading,
      required this.role,
      required this.isAgreeTerms,
      required this.isLogin,
      required this.error,
      required this.showPass});

  @override
  final bool isLoading;
  @override
  final RoleType role;
  @override
  final bool isAgreeTerms;
  @override
  final bool isLogin;
  @override
  final String error;
  @override
  final bool showPass;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, role: $role, isAgreeTerms: $isAgreeTerms, isLogin: $isLogin, error: $error, showPass: $showPass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isAgreeTerms, isAgreeTerms) ||
                other.isAgreeTerms == isAgreeTerms) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.showPass, showPass) ||
                other.showPass == showPass));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, role, isAgreeTerms, isLogin, error, showPass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required final bool isLoading,
      required final RoleType role,
      required final bool isAgreeTerms,
      required final bool isLogin,
      required final String error,
      required final bool showPass}) = _$_LoginState;

  @override
  bool get isLoading;
  @override
  RoleType get role;
  @override
  bool get isAgreeTerms;
  @override
  bool get isLogin;
  @override
  String get error;
  @override
  bool get showPass;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
