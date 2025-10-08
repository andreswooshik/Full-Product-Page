import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductRecommendations extends StatelessWidget {
  const ProductRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Product> recommendations = [
      Product(
        id: "rec1",
        title: "Stylish Look",
        description: "Lorem ipsum dolor sit amet consectetur",
        price: 17.00,
        image: "assets/yml1.png",
        specs: const ProductSpecifications(),
      ),
      Product(
        id: "rec2", 
        title: "Casual Style",
        description: "Lorem ipsum dolor sit amet consectetur", 
        price: 17.00,
        image: "assets/yml2.png",
        specs: const ProductSpecifications(),
      ),
      Product(
        id: "rec3", 
        title: "Premium Fashion",
        description: "Lorem ipsum dolor sit amet consectetur", 
        price: 17.00,
        image: "assets/yml3.png",
        specs: const ProductSpecifications(),
      ),
      Product(
        id: "rec4", 
        title: "Elegant Wear",
        description: "Lorem ipsum dolor sit amet consectetur", 
        price: 17.00,
        image: "assets/yml4.png",
        specs: const ProductSpecifications(),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "You Might Like",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final product = recommendations[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[100],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                                size: 40,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black87,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}