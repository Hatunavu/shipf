// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserPostState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFirstLoad => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<PostData> get posts => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPostStateCopyWith<UserPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostStateCopyWith<$Res> {
  factory $UserPostStateCopyWith(
          UserPostState value, $Res Function(UserPostState) then) =
      _$UserPostStateCopyWithImpl<$Res, UserPostState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      List<PostData> posts,
      int page,
      bool hasReachedEnd});
}

/// @nodoc
class _$UserPostStateCopyWithImpl<$Res, $Val extends UserPostState>
    implements $UserPostStateCopyWith<$Res> {
  _$UserPostStateCopyWithImpl(this._value, this._then);

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
    Object? posts = null,
    Object? page = null,
    Object? hasReachedEnd = null,
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
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostData>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPostStateImplCopyWith<$Res>
    implements $UserPostStateCopyWith<$Res> {
  factory _$$UserPostStateImplCopyWith(
          _$UserPostStateImpl value, $Res Function(_$UserPostStateImpl) then) =
      __$$UserPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFirstLoad,
      String? error,
      List<PostData> posts,
      int page,
      bool hasReachedEnd});
}

/// @nodoc
class __$$UserPostStateImplCopyWithImpl<$Res>
    extends _$UserPostStateCopyWithImpl<$Res, _$UserPostStateImpl>
    implements _$$UserPostStateImplCopyWith<$Res> {
  __$$UserPostStateImplCopyWithImpl(
      _$UserPostStateImpl _value, $Res Function(_$UserPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFirstLoad = null,
    Object? error = freezed,
    Object? posts = null,
    Object? page = null,
    Object? hasReachedEnd = null,
  }) {
    return _then(_$UserPostStateImpl(
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
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostData>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserPostStateImpl implements _UserPostState {
  const _$UserPostStateImpl(
      {required this.isLoading,
      required this.isFirstLoad,
      this.error,
      required final List<PostData> posts,
      required this.page,
      required this.hasReachedEnd})
      : _posts = posts;

  @override
  final bool isLoading;
  @override
  final bool isFirstLoad;
  @override
  final String? error;
  final List<PostData> _posts;
  @override
  List<PostData> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final int page;
  @override
  final bool hasReachedEnd;

  @override
  String toString() {
    return 'UserPostState(isLoading: $isLoading, isFirstLoad: $isFirstLoad, error: $error, posts: $posts, page: $page, hasReachedEnd: $hasReachedEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPostStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFirstLoad, isFirstLoad) ||
                other.isFirstLoad == isFirstLoad) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasReachedEnd, hasReachedEnd) ||
                other.hasReachedEnd == hasReachedEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isFirstLoad, error,
      const DeepCollectionEquality().hash(_posts), page, hasReachedEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPostStateImplCopyWith<_$UserPostStateImpl> get copyWith =>
      __$$UserPostStateImplCopyWithImpl<_$UserPostStateImpl>(this, _$identity);
}

abstract class _UserPostState implements UserPostState {
  const factory _UserPostState(
      {required final bool isLoading,
      required final bool isFirstLoad,
      final String? error,
      required final List<PostData> posts,
      required final int page,
      required final bool hasReachedEnd}) = _$UserPostStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isFirstLoad;
  @override
  String? get error;
  @override
  List<PostData> get posts;
  @override
  int get page;
  @override
  bool get hasReachedEnd;
  @override
  @JsonKey(ignore: true)
  _$$UserPostStateImplCopyWith<_$UserPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
