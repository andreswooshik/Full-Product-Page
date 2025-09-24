// lib/models.dart
// Domain models only — Single Responsibility Principle (SRP)

class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final List<Variation> variations;
  final List<DeliveryOption> deliveryOptions;
  final List<Review> reviews;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.variations,
    required this.deliveryOptions,
    required this.reviews,
  });
}

class Variation {
  final String id;
  final String color; // could be an enum in larger apps
  final String size;
  final String image; // url or asset path

  const Variation({
    required this.id,
    required this.color,
    required this.size,
    required this.image,
  });
}

class DeliveryOption {
  final String id;
  final String name;
  final String eta; // "5-7 days"
  final double price;

  const DeliveryOption({
    required this.id,
    required this.name,
    required this.eta,
    required this.price,
  });
}

class Review {
  final String user;
  final double rating;
  final String text;

  const Review({
    required this.user,
    required this.rating,
    required this.text,
  });
}
