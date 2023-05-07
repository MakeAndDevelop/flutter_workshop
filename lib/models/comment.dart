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
}
