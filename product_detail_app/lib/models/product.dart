import 'variataions.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  final List<String> images;
  final ProductSpecifications specs;
  final List<Variation> variations;
  
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    this.images = const [],
    required this.specs,
    this.variations = const [],
  });
  
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      image: json['image'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      specs: ProductSpecifications.fromJson(json['specs'] ?? {}),
      variations: (json['variations'] as List<dynamic>? ?? [])
          .map((v) => Variation.fromJson(v))
          .toList(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'images': images,
      'specs': specs.toJson(),
      'variations': variations.map((v) => v.toJson()).toList(),
    };
  }
}

class ProductSpecifications {
  final Map<String, String> materials;
  final String origin;
  final List<String> sizes;
  
  const ProductSpecifications({
    this.materials = const {},
    this.origin = '',
    this.sizes = const [],
  });
  
  factory ProductSpecifications.fromJson(Map<String, dynamic> json) {
    return ProductSpecifications(
      materials: Map<String, String>.from(json['materials'] ?? {}),
      origin: json['origin'] ?? '',
      sizes: List<String>.from(json['sizes'] ?? []),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'materials': materials,
      'origin': origin,
      'sizes': sizes,
    };
  }
}