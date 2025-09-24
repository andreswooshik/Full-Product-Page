import 'models.dart';
import 'dart:async';

abstract class IProductRepository {
  Future<Product> fetchProductById(String id);
}

class MockProductRepository implements IProductRepository {
  @override
  Future<Product> fetchProductById(String id) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Return mock data
    return Product(
      id: id,
      title: "Mock Product",
      price: 29.99,
      description: "This is a mock product used for demonstration purposes.",
      images: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200"
      ],
      variations: [
        Variation(
          id: "v1",
          color: "Red",
          size: "M",
          image: "https://via.placeholder.com/150/FF0000",
        ),
        Variation(
          id: "v2",
          color: "Blue",
          size: "L",
          image: "https://via.placeholder.com/150/0000FF",
        ),
      ],
      deliveryOptions: [
        DeliveryOption(
          id: "d1",
          name: "Standard Shipping",
          eta: "5-7 days",
          price: 4.99,
        ),
        DeliveryOption(
          id: "d2",
          name: "Express Shipping",
          eta: "2-3 days",
          price: 9.99,
        ),
      ],
      reviews: [
        Review(
          user: "Alice",
          rating: 4.5,
          text: "Great product! Highly recommend.",
        ),
        Review(
          user: "Bob",
          rating: 3.0,
          text: "It's okay, does the job.",
        ),
      ],
    );
  }
}