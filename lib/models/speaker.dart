import 'package:json_annotation/json_annotation.dart';

part 'speaker.g.dart';

@JsonSerializable()
class Speaker {
  final int id;
  final String name;
  final String subtitle;
  final String? bio;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  Speaker({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.bio,
    required this.imageUrl,
  });

  /// A necessary factory constructor for creating a new Speaker instance from json data
  factory Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  Map<String, dynamic> toJson() => _$SpeakerToJson(this);
}
