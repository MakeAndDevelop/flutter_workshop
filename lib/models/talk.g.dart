// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Talk _$TalkFromJson(Map<String, dynamic> json) => Talk(
      id: json['id'] as int,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      speakerId: json['speaker_id'] as int,
      stageId: json['stage_id'] as int,
    );

Map<String, dynamic> _$TalkToJson(Talk instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'abstract': instance.abstract,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'speaker_id': instance.speakerId,
      'stage_id': instance.stageId,
    };
