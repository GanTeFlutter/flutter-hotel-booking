class Facility {
  Facility({
    required this.id,
    required this.name,
    required this.category,
    this.icon,
  });
  final String id;
  final String name;
  final String category;
  final String? icon;
}
