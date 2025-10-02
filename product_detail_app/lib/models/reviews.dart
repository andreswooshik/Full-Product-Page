class Review {
  final String id;
  final String userName;
  final String userImage;
  final int rating;
  final String comment;
  final DateTime createdAt;

  const Review({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
  
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userImage': userImage,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}