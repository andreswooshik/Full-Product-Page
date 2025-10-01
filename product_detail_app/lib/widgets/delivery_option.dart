import 'package:flutter/material.dart';

class DeliveryOption extends StatelessWidget {
  final String title;
  final String days;
  final String price;

  const DeliveryOption({
    super.key,
    required this.title,
    required this.days,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(238, 0, 76, 255)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Text(days, style: const TextStyle(fontSize: 14, color: Color.fromARGB(238, 0, 76, 255))),
              ],
            ),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
