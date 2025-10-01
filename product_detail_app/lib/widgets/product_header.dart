import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/topbar.png",
          height: screenHeight * 0.45,
          width: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "\$17.00",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 6),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                "Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
