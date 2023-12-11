// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemNoteModel _$ItemNoteModelFromJson(Map<String, dynamic> json) =>
    ItemNoteModel(
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      time: json['time'] as String? ?? '',
      noteStatus: json['noteStatus'] as bool? ?? false,
      linkImage: json['linkImage'] as String,
    );

Map<String, dynamic> _$ItemNoteModelToJson(ItemNoteModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'time': instance.time,
      'noteStatus': instance.noteStatus,
      'linkImage': instance.linkImage,
    };
