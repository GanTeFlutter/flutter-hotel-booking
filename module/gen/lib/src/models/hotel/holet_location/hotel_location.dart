import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_location.freezed.dart';
part 'hotel_location.g.dart';

@freezed
abstract class HotelLocation with _$HotelLocation {
  const factory HotelLocation({
    required String address,
    required String city,
    required String country,
    required double lat,
    required double lng, 
  }) = _HotelLocation;

  factory HotelLocation.fromJson(Map<String, dynamic> json) =>
      _$HotelLocationFromJson(json);
}
