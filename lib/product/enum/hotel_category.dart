// constants.dart veya enums.dart
enum HotelCategory {
  villas,
  hotels,
  apartment;

  String get label {
    switch (this) {
      case HotelCategory.villas:
        return 'Villas';
      case HotelCategory.hotels:
        return 'Hotels';
      case HotelCategory.apartment:
        return 'Apartement';
    }
  }
}
