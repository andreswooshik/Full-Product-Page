import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductMostPopular extends StatelessWidget {
  const ProductMostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Most Popular",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              Row(
                children: [
                  Text("See All",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 0, 126, 230),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                ProductCard(
                    imagePath: "assets/mostpopu1.png",
                    likes: "1780",
                    label: "New"),
                ProductCard(
                    imagePath: "assets/veronica.png",
                    likes: "1780",
                    label: "Sale"),
                ProductCard(
                    imagePath: "assets/mostpop3.png",
                    likes: "1780",
                    label: "Hot"),
                ProductCard(
                    imagePath: "assets/mostpop4.png",
                    likes: "1780",
                    label: "New"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
