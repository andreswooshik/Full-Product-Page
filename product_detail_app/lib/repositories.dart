import 'models.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

abstract class IProductRepository {
  Future<Product> fetchProductById(String id);
  Future<void> toggleFavorite(String productId, bool isFavorite);
  Future<void> addToCart(String productId, String variationId, String deliveryId);
  Future<void> createOrder(String productId, String variationId, String deliveryId);
}

class MockProductRepository implements IProductRepository {
  @override
  Future<Product> fetchProductById(String id) async {
    await Future.delayed(const Duration(seconds: 1));

    return Product(
      id: id,
      price: 17.00,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris. scelerisque eu mauris id. pretium pulvinar sapien",
      images: [
        "https://picsum.photos/800/450?random=1",
        "https://picsum.photos/800/450?random=2",
        "https://picsum.photos/800/450?random=3"
      ],
      variations: [
        const Variation(
          id: "v1",
          color: "Pink",
          size: "M",
          image: "https://picsum.photos/800/450?random=2",
        ),
      ],
      specifications: const [
        Specification(
          name: "Material",
          details: ["Cotton 95%", "Nylon 5%"],
        ),
        Specification(
          name: "Origin",
          details: ["EU"],
        ),
      ],
      deliveryMethods: [
        const DeliveryOption(
          id: "d1",
          name: "Standard",
          eta: "5-7 days",
          price: 4.99,
        ),
        const DeliveryOption(
          id: "d2",
          name: "Express",
          eta: "1-2 days",
          price: 12.00,
        ),
      ],
      reviews: [
        const Review(
          user: "Veronika",
          rating: 4.5,
          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        ),
      ],
    );
  }

  @override
  Future<void> toggleFavorite(String productId, bool isFavorite) async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('Toggled favorite for product $productId to $isFavorite');
  }

  @override
  Future<void> addToCart(String productId, String variationId, String deliveryId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (productId.isEmpty || variationId.isEmpty || deliveryId.isEmpty) {
      throw Exception('Invalid cart parameters');
    }
    
    debugPrint('Added to cart - Product: $productId, Variation: $variationId, Delivery: $deliveryId');
  }

  @override
  Future<void> createOrder(String productId, String variationId, String deliveryId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (productId.isEmpty || variationId.isEmpty || deliveryId.isEmpty) {
      throw Exception('Invalid order parameters');
    }
    
    debugPrint('Created order - Product: $productId, Variation: $variationId, Delivery: $deliveryId');
  }
}