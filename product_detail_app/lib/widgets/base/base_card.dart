import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

abstract class BaseCard extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  
  const BaseCard({
    super.key,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: AppTheme.cardDecoration,
      child: buildContent(context),
    );
  }
  
  Widget buildContent(BuildContext context);
}