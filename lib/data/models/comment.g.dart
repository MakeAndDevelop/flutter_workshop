// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      content: json['content'] as String,
      talkId: json['talk_id'] as int,
      userId: json['user_id'] as String,
      email: json['user_email'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'content': instance.content,
      'talk_id': instance.talkId,
      'user_id': instance.userId,
      'user_email': instance.email,
    };
