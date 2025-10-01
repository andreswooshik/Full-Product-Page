import 'package:flutter/material.dart';

class ProductSpecs extends StatelessWidget {
  const ProductSpecs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Specifications",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          const Text("Material",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Row(
            children: [
              _specTag("Cotton 95%", const Color.fromARGB(255, 244, 206, 219)),
              const SizedBox(width: 8),
              _specTag("Nylon 5%", const Color.fromARGB(255, 244, 206, 219)),
            ],
          ),
          const SizedBox(height: 12),
          const Text("Origin",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
          _specTag("EU", const Color.fromARGB(255, 175, 189, 224)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text("Size Guide",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
              const Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(255, 0, 126, 230),
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _specTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }
}
