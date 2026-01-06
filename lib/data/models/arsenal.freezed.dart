// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arsenal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Arsenal _$ArsenalFromJson(Map<String, dynamic> json) {
  return _Arsenal.fromJson(json);
}

/// @nodoc
mixin _$Arsenal {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _tagsFromJson)
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this Arsenal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Arsenal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArsenalCopyWith<Arsenal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArsenalCopyWith<$Res> {
  factory $ArsenalCopyWith(Arsenal value, $Res Function(Arsenal) then) =
      _$ArsenalCopyWithImpl<$Res, Arsenal>;
  @useResult
  $Res call({
    int? id,
    String title,
    String content,
    String category,
    @JsonKey(fromJson: _tagsFromJson) List<String> tags,
  });
}

/// @nodoc
class _$ArsenalCopyWithImpl<$Res, $Val extends Arsenal>
    implements $ArsenalCopyWith<$Res> {
  _$ArsenalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Arsenal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = null,
    Object? category = null,
    Object? tags = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ArsenalImplCopyWith<$Res> implements $ArsenalCopyWith<$Res> {
  factory _$$ArsenalImplCopyWith(
    _$ArsenalImpl value,
    $Res Function(_$ArsenalImpl) then,
  ) = __$$ArsenalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String title,
    String content,
    String category,
    @JsonKey(fromJson: _tagsFromJson) List<String> tags,
  });
}

/// @nodoc
class __$$ArsenalImplCopyWithImpl<$Res>
    extends _$ArsenalCopyWithImpl<$Res, _$ArsenalImpl>
    implements _$$ArsenalImplCopyWith<$Res> {
  __$$ArsenalImplCopyWithImpl(
    _$ArsenalImpl _value,
    $Res Function(_$ArsenalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Arsenal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? content = null,
    Object? category = null,
    Object? tags = null,
  }) {
    return _then(
      _$ArsenalImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ArsenalImpl implements _Arsenal {
  _$ArsenalImpl({
    this.id,
    required this.title,
    required this.content,
    required this.category,
    @JsonKey(fromJson: _tagsFromJson) required final List<String> tags,
  }) : _tags = tags;

  factory _$ArsenalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArsenalImplFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String category;
  final List<String> _tags;
  @override
  @JsonKey(fromJson: _tagsFromJson)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Arsenal(id: $id, title: $title, content: $content, category: $category, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArsenalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    content,
    category,
    const DeepCollectionEquality().hash(_tags),
  );

  /// Create a copy of Arsenal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArsenalImplCopyWith<_$ArsenalImpl> get copyWith =>
      __$$ArsenalImplCopyWithImpl<_$ArsenalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArsenalImplToJson(this);
  }
}

abstract class _Arsenal implements Arsenal {
  factory _Arsenal({
    final int? id,
    required final String title,
    required final String content,
    required final String category,
    @JsonKey(fromJson: _tagsFromJson) required final List<String> tags,
  }) = _$ArsenalImpl;

  factory _Arsenal.fromJson(Map<String, dynamic> json) = _$ArsenalImpl.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get category;
  @override
  @JsonKey(fromJson: _tagsFromJson)
  List<String> get tags;

  /// Create a copy of Arsenal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArsenalImplCopyWith<_$ArsenalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
