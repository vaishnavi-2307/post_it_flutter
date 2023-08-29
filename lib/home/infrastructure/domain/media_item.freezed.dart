// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) {
  return _MediaItem.fromJson(json);
}

/// @nodoc
mixin _$MediaItem {
  String get id => throw _privateConstructorUsedError;
  int get datetime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaItemCopyWith<MediaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaItemCopyWith<$Res> {
  factory $MediaItemCopyWith(MediaItem value, $Res Function(MediaItem) then) =
      _$MediaItemCopyWithImpl<$Res, MediaItem>;
  @useResult
  $Res call(
      {String id, int datetime, String type, String? description, String link});
}

/// @nodoc
class _$MediaItemCopyWithImpl<$Res, $Val extends MediaItem>
    implements $MediaItemCopyWith<$Res> {
  _$MediaItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? datetime = null,
    Object? type = null,
    Object? description = freezed,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaItemCopyWith<$Res> implements $MediaItemCopyWith<$Res> {
  factory _$$_MediaItemCopyWith(
          _$_MediaItem value, $Res Function(_$_MediaItem) then) =
      __$$_MediaItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, int datetime, String type, String? description, String link});
}

/// @nodoc
class __$$_MediaItemCopyWithImpl<$Res>
    extends _$MediaItemCopyWithImpl<$Res, _$_MediaItem>
    implements _$$_MediaItemCopyWith<$Res> {
  __$$_MediaItemCopyWithImpl(
      _$_MediaItem _value, $Res Function(_$_MediaItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? datetime = null,
    Object? type = null,
    Object? description = freezed,
    Object? link = null,
  }) {
    return _then(_$_MediaItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaItem implements _MediaItem {
  _$_MediaItem(
      {required this.id,
      required this.datetime,
      required this.type,
      required this.description,
      required this.link});

  factory _$_MediaItem.fromJson(Map<String, dynamic> json) =>
      _$$_MediaItemFromJson(json);

  @override
  final String id;
  @override
  final int datetime;
  @override
  final String type;
  @override
  final String? description;
  @override
  final String link;

  @override
  String toString() {
    return 'MediaItem(id: $id, datetime: $datetime, type: $type, description: $description, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, datetime, type, description, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaItemCopyWith<_$_MediaItem> get copyWith =>
      __$$_MediaItemCopyWithImpl<_$_MediaItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaItemToJson(
      this,
    );
  }
}

abstract class _MediaItem implements MediaItem {
  factory _MediaItem(
      {required final String id,
      required final int datetime,
      required final String type,
      required final String? description,
      required final String link}) = _$_MediaItem;

  factory _MediaItem.fromJson(Map<String, dynamic> json) =
      _$_MediaItem.fromJson;

  @override
  String get id;
  @override
  int get datetime;
  @override
  String get type;
  @override
  String? get description;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$_MediaItemCopyWith<_$_MediaItem> get copyWith =>
      throw _privateConstructorUsedError;
}
