// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hotel _$HotelFromJson(Map<String, dynamic> json) => _Hotel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  location: HotelLocation.fromJson(json['location'] as Map<String, dynamic>),
  averageRating: (json['averageRating'] as num).toDouble(),
  totalReviews: (json['totalReviews'] as num).toInt(),
  starRating: (json['starRating'] as num).toInt(),
  minPrice: (json['minPrice'] as num).toDouble(),
  facilities: (json['facilities'] as List<dynamic>)
      .map((e) => Facility.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['isActive'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  category: $enumDecodeNullable(_$HotelCategoryEnumMap, json['category']),
);

Map<String, dynamic> _$HotelToJson(_Hotel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'images': instance.images,
  'location': instance.location.toJson(),
  'averageRating': instance.averageRating,
  'totalReviews': instance.totalReviews,
  'starRating': instance.starRating,
  'minPrice': instance.minPrice,
  'facilities': instance.facilities.map((e) => e.toJson()).toList(),
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
  'category': _$HotelCategoryEnumMap[instance.category],
};

const _$HotelCategoryEnumMap = {
  HotelCategory.villas: 'villas',
  HotelCategory.hotels: 'hotels',
  HotelCategory.apartment: 'apartment',
};
