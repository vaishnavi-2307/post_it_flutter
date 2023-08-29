// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_item.freezed.dart';
part 'media_item.g.dart';

@freezed
class MediaItem with _$MediaItem {
  factory MediaItem({
    required String id,
    required int datetime,
    required String type,
    required String? description,
    required String link,
  }) = _MediaItem;

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);
}
