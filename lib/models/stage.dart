import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

@JsonSerializable()
class Stage {
  final int id;
  final String name;

  Stage({
    required this.id,
    required this.name,
  });

  /// A necessary factory constructor for creating a new Stage instance from json data
  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  Map<String, dynamic> toJson() => _$StageToJson(this);
}
