import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gen/gen.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
abstract class Hotel with _$Hotel {
  @JsonSerializable(explicitToJson: true)
  const factory Hotel({
    required String id,
    required String name,
    required String description,
    required List<String> images,
    required HotelLocation location,
    required double averageRating,
    required int totalReviews,
    required int starRating,
    required double minPrice,
    required List<Facility> facilities,
    required bool isActive,
    required DateTime createdAt,
    required HotelCategory? category,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}
