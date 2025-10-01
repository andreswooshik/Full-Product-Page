import 'package:flutter/material.dart';
import '../widgets/product_header.dart';
import '../widgets/product_variations.dart';
import '../widgets/product_specs.dart';
import '../widgets/product_delivery.dart';
import '../widgets/product_reviews.dart';
import '../widgets/product_most_popular.dart';
import '../widgets/product_recommendations.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ProductHeader(),
              ProductVariations(),
              ProductSpecs(),
              ProductDelivery(),
              ProductReviews(),
              ProductMostPopular(),
              ProductRecommendations(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
        ),
        child: Row(
          children: [
            Icon(Icons.favorite_border, color: Colors.black, size: 30),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Add to cart"),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 126, 230),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Buy Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
