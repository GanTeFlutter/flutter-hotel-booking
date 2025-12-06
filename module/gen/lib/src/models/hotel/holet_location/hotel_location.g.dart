// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotelLocation _$HotelLocationFromJson(Map<String, dynamic> json) =>
    _HotelLocation(
      address: json['address'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$HotelLocationToJson(_HotelLocation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'lat': instance.lat,
      'lng': instance.lng,
    };
