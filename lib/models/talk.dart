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
  final Speaker speaker;
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
}
