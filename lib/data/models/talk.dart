import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'talk.g.dart';

@JsonSerializable()
class Talk {
  final int id;
  final String title;
  final String abstract;

  @JsonKey(name: 'start_time')
  final DateTime startTime;

  @JsonKey(name: 'end_time')
  final DateTime endTime;

  @JsonKey(name: 'speakers')
  final Speaker speaker;

  @JsonKey(name: 'stages')
  final Stage stage;

  Talk({
    required this.id,
    required this.title,
    required this.abstract,
    required this.startTime,
    required this.endTime,
    required this.speaker,
    required this.stage,
  });

  /// A necessary factory constructor for creating a new Talk instance from json data
  factory Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  Map<String, dynamic> toJson() => _$TalkToJson(this);
}
