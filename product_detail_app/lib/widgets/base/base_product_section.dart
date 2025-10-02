import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

abstract class BaseProductSection extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  
  const BaseProductSection({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          const SizedBox(height: AppTheme.spacingMedium),
          buildContent(context),
        ],
      ),
    );
  }
  
  Widget buildTitle() {
    return Text(title, style: AppTheme.titleLarge);
  }
  
  Widget buildContent(BuildContext context);
}