import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductRecommendations extends StatelessWidget {
  const ProductRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(image: "assets/yml1.png", title: "Lorem ipsum dolor sit amet consectetur", price: "\$17.00"),
      Product(image: "assets/mostpop4.png", title: "Lorem ipsum dolor sit amet consectetur", price: "\$17.00"),
      Product(image: "assets/var1.png", title: "Lorem ipsum dolor sit amet consectetur", price: "\$17.00"),
      Product(image: "assets/yml4.png", title: "Lorem ipsum dolor sit amet consectetur", price: "\$17.00"),
      Product(image: "assets/yml5.png", title: "Lorem ipsum dolor sit amet consectetur", price: "\$17.00"),
      Product(image: "assets/yml6.png", title: "Lorem ipsum dolor sit amet consectetur", price: "\$17.00"),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("You Might Like",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                        height: 160,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(product.price,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
