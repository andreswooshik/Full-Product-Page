class Variation {
  final String id;
  final String color;
  final String size;
  final String image;
  final double? priceModifier;
  final bool available;

  const Variation({
    required this.id,
    required this.color,
    required this.size,
    required this.image,
    this.priceModifier,
    this.available = true,
  });
  
  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      id: json['id'] ?? '',
      color: json['color'] ?? '',
      size: json['size'] ?? '',
      image: json['image'] ?? '',
      priceModifier: json['priceModifier']?.toDouble(),
      available: json['available'] ?? true,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
      'size': size,
      'image': image,
      'priceModifier': priceModifier,
      'available': available,
    };
  }
}