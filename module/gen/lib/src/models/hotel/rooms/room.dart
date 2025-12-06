class Room {
  Room({
    required this.id,
    required this.type,
    required this.price,
    required this.capacity,
    required this.images,
    required this.amenities,
    required this.isAvailable,
  });
  final String id;
  final String type;
  final double price;
  final int capacity;
  final List<String> images;
  final List<String> amenities;
  final bool isAvailable;
}
