// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchPostState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFirstLoad => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<AddressDataModel> get provinces => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPostStateCopyWith<SearchPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPostStateCopyWith<$Res> {
  factory $SearchPostStateCopyWith(
          SearchPostState value, $Res Function(SearchPostState) then) =
      _$SearchPostStateCopyWithImpl<$Res, SearchPostState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      List<AddressDataModel> provinces});
}

/// @nodoc
class _$SearchPostStateCopyWithImpl<$Res, $Val extends SearchPostState>
    implements $SearchPostStateCopyWith<$Res> {
  _$SearchPostStateCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchPostStateCopyWith<$Res>
    implements $SearchPostStateCopyWith<$Res> {
  factory _$$_SearchPostStateCopyWith(
          _$_SearchPostState value, $Res Function(_$_SearchPostState) then) =
      __$$_SearchPostStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      List<AddressDataModel> provinces});
}

/// @nodoc
class __$$_SearchPostStateCopyWithImpl<$Res>
    extends _$SearchPostStateCopyWithImpl<$Res, _$_SearchPostState>
    implements _$$_SearchPostStateCopyWith<$Res> {
  __$$_SearchPostStateCopyWithImpl(
      _$_SearchPostState _value, $Res Function(_$_SearchPostState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstLoad = null,
    Object? error = freezed,
    Object? provinces = null,
  }) {
    return _then(_$_SearchPostState(
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
    ));
  }
}

/// @nodoc

class _$_SearchPostState implements _SearchPostState {
  const _$_SearchPostState(
      {required this.isLoading,
      required this.isFirstLoad,
      this.error,
      required final List<AddressDataModel> provinces})
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
  String toString() {
    return 'SearchPostState(isLoading: $isLoading, isFirstLoad: $isFirstLoad, error: $error, provinces: $provinces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchPostState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFirstLoad, isFirstLoad) ||
                other.isFirstLoad == isFirstLoad) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isFirstLoad, error,
      const DeepCollectionEquality().hash(_provinces));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchPostStateCopyWith<_$_SearchPostState> get copyWith =>
      __$$_SearchPostStateCopyWithImpl<_$_SearchPostState>(this, _$identity);
}

abstract class _SearchPostState implements SearchPostState {
  const factory _SearchPostState(
      {required final bool isLoading,
      required final bool isFirstLoad,
      final String? error,
      required final List<AddressDataModel> provinces}) = _$_SearchPostState;

  @override
  bool get isLoading;
  @override
  bool get isFirstLoad;
  @override
  String? get error;
  @override
  List<AddressDataModel> get provinces;
  @override
  @JsonKey(ignore: true)
  _$$_SearchPostStateCopyWith<_$_SearchPostState> get copyWith =>
      throw _privateConstructorUsedError;
}
