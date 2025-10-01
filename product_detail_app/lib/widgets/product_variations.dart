import 'package:flutter/material.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Variations",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              const SizedBox(width: 12),
              _variationTag("Pink"),
              const SizedBox(width: 8),
              _variationTag("M"),
              const Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(255, 0, 126, 230),
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _variationImage("assets/var1.png")),
              const SizedBox(width: 12),
              Expanded(child: _variationImage("assets/var2.png")),
              const SizedBox(width: 12),
              Expanded(child: _variationImage("assets/var3.png")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _variationTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _variationImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(path, fit: BoxFit.cover, height: 140),
    );
  }
}
