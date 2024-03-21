// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFirstLoad => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<PostData> get posts => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res, PostState>;
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
class _$PostStateCopyWithImpl<$Res, $Val extends PostState>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$$_PostStateCopyWith(
          _$_PostState value, $Res Function(_$_PostState) then) =
      __$$_PostStateCopyWithImpl<$Res>;
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
class __$$_PostStateCopyWithImpl<$Res>
    extends _$PostStateCopyWithImpl<$Res, _$_PostState>
    implements _$$_PostStateCopyWith<$Res> {
  __$$_PostStateCopyWithImpl(
      _$_PostState _value, $Res Function(_$_PostState) _then)
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
    return _then(_$_PostState(
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

class _$_PostState implements _PostState {
  const _$_PostState(
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
    return 'PostState(isLoading: $isLoading, isFirstLoad: $isFirstLoad, error: $error, posts: $posts, page: $page, hasReachedEnd: $hasReachedEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostState &&
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
  _$$_PostStateCopyWith<_$_PostState> get copyWith =>
      __$$_PostStateCopyWithImpl<_$_PostState>(this, _$identity);
}

abstract class _PostState implements PostState {
  const factory _PostState(
      {required final bool isLoading,
      required final bool isFirstLoad,
      final String? error,
      required final List<PostData> posts,
      required final int page,
      required final bool hasReachedEnd}) = _$_PostState;

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
  _$$_PostStateCopyWith<_$_PostState> get copyWith =>
      throw _privateConstructorUsedError;
}
