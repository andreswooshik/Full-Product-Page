class Product {
  final String id;
  final double price;
  final String description;
  final List<String> images;
  final List<Variation> variations;
  final List<Specification> specifications;
  final List<DeliveryOption> deliveryMethods;
  final List<Review> reviews;

  const Product({
    required this.id,
    required this.price,
    required this.description,
    required this.images,
    required this.variations,
    required this.specifications,
    required this.deliveryMethods,
    required this.reviews,
  });
}

class Variation {
  final String id;
  final String color;
  final String size;
  final String image;

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
  final String eta;
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

class Specification {
  final String name;
  final List<String> details;

  const Specification({
    required this.name,
    required this.details,
  });
}