// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'icon': instance.icon,
};
