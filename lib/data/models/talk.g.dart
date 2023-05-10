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
      speaker: Speaker.fromJson(json['speakers'] as Map<String, dynamic>),
      stage: Stage.fromJson(json['stages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TalkToJson(Talk instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'abstract': instance.abstract,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'speakers': instance.speaker,
      'stages': instance.stage,
    };
