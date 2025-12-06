import 'package:json_annotation/json_annotation.dart';

part 'facility.g.dart';

@JsonSerializable()
class Facility {
  Facility({
    required this.id,
    required this.name,
    required this.category,
    this.icon,
  });

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);
  final String id;
  final String name;
  final String category;
  final String? icon;

  Map<String, dynamic> toJson() => _$FacilityToJson(this);
}
