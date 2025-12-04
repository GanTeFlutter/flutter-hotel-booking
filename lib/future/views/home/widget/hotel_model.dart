class HotelModel {
  const HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.pricePerNight,
    required this.rating,
    this.reviewCount = 0,
    this.amenities = const [],
    this.description = '',
    this.isAssetImage = true,
  });

  // JSON'dan model oluşturma
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int? ?? 0,
      amenities: List<String>.from((json['amenities'] as List<dynamic>?) ?? []),
      description: json['description'] as String? ?? '',
      isAssetImage: json['isAssetImage'] as bool? ?? false,
    );
  }
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double pricePerNight;
  final double rating;
  final int reviewCount;
  final List<String> amenities;
  final String description;
  final bool isAssetImage;

  // Model'i JSON'a çevirme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'imageUrl': imageUrl,
      'pricePerNight': pricePerNight,
      'rating': rating,
      'reviewCount': reviewCount,
      'amenities': amenities,
      'description': description,
      'isAssetImage': isAssetImage,
    };
  }

  // copyWith metodu
  HotelModel copyWith({
    String? id,
    String? name,
    String? location,
    String? imageUrl,
    double? pricePerNight,
    double? rating,
    int? reviewCount,
    List<String>? amenities,
    String? description,
    bool? isAssetImage,
  }) {
    return HotelModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      amenities: amenities ?? this.amenities,
      description: description ?? this.description,
      isAssetImage: isAssetImage ?? this.isAssetImage,
    );
  }


}
