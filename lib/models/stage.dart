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
}
