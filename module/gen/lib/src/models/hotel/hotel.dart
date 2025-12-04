import 'package:gen/src/models/hotel/facility.dart';
import 'package:gen/src/models/hotel/holet_location.dart';

class Hotel {
  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.location,
    required this.averageRating,
    required this.totalReviews,
    required this.starRating,
    required this.minPrice,
    required this.facilities,
    required this.isActive,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String description;
  final List<String> images;
  final HotelLocation location;

  /// Otelin genel puanı (1–5 arası ortalama)
  final double averageRating;

  /// Toplam yapılan yorum sayısı
  final int totalReviews;

  /// Otelin yıldız sayısı (örn: 3, 4, 5 yıldız)
  final int starRating;

  /// Oteldeki en düşük gecelik fiyat
  final double minPrice;

  /// Otelin sunduğu tesis özellikleri (WiFi, havuz, park vb.)
  final List<Facility> facilities;

  /// Otel aktif mi? (yayında mı?)
  final bool isActive;

  /// Otelin oluşturulma tarihi
  final DateTime createdAt;
}
