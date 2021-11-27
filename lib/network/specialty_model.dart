import 'package:json_annotation/json_annotation.dart';

part 'specialty_model.g.dart';

@JsonSerializable()
class Specialty {
  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialtyToJson(this);
  @JsonKey(name: 'id')
  int id;
  String name;

  Specialty({
    required this.id,
    required this.name,
  });
}
