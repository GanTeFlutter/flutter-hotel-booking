class Review {
  Review({
    required this.id,
    required this.hotelId,
    required this.userId,
    required this.userName,
    required this.comment,
    required this.rating,
    required this.createdAt,
    this.userAvatar,
  });
  final String id;
  final String hotelId;
  final String userId;
  final String userName;
  final String? userAvatar;
  final String comment;
  final ReviewRating rating;
  final DateTime createdAt;
}

class ReviewRating {
  ReviewRating({
    required this.cleanliness,
    required this.location,
    required this.staff,
    required this.valueForMoney,
    required this.comfort,
  });
  final double cleanliness;
  final double location;
  final double staff;
  final double valueForMoney;
  final double comfort;
}
