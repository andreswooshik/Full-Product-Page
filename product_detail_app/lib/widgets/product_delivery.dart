import 'package:flutter/material.dart';
import 'delivery_option.dart';

class ProductDelivery extends StatelessWidget {
  const ProductDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Delivery",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          DeliveryOption(title: "Standard", days: "5-7 days", price: "\$3.00"),
          DeliveryOption(title: "Express", days: "1-2 days", price: "\$12.00"),
        ],
      ),
    );
  }
}
