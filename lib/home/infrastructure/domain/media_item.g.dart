// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaItem _$$_MediaItemFromJson(Map<String, dynamic> json) => _$_MediaItem(
      id: json['id'] as String,
      datetime: json['datetime'] as int,
      type: json['type'] as String,
      description: json['description'] as String?,
      link: json['link'] as String,
    );

Map<String, dynamic> _$$_MediaItemToJson(_$_MediaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datetime': instance.datetime,
      'type': instance.type,
      'description': instance.description,
      'link': instance.link,
    };
