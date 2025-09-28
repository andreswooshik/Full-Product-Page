import 'package:flutter/material.dart';
import '../models.dart';

class VariationSelector extends StatelessWidget {
  final List<Variation> variations;
  final List<String> images;

  const VariationSelector({
    super.key,
    required this.variations,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Variations',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 16),
            Text(
              '${variations.first.color}  ${variations.first.size}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 20,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: Row(
            children: images
                .map((url) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          url,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stack) {
                            return Container(
                              width: 100, 
                              height: 100,
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}