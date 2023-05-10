import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  String content;

  @JsonKey(name: 'talk_id')
  int talkId;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'user_email')
  String email;

  Comment({
    required this.content,
    required this.talkId,
    required this.userId,
    required this.email,
  });

  /// A necessary factory constructor for creating a new Comment instance from json data
  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
