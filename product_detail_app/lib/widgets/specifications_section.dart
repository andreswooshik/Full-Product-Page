import 'package:flutter/material.dart';
import '../models.dart';

class SpecificationsSection extends StatelessWidget {
  final List<Specification> specifications;

  const SpecificationsSection({
    super.key,
    required this.specifications,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specifications',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ...specifications.map((spec) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              spec.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: spec.details.map((detail) => Chip(
                label: Text(detail),
                backgroundColor: Colors.grey[200],
              )).toList(),
            ),
            const SizedBox(height: 16),
          ],
        )),
      ],
    );
  }
}