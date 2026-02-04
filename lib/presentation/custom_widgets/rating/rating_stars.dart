import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/value_manager.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final int maxStars;
  final double size;
  final Color? color;

  const RatingStars({
    super.key,
    required this.rating,
    this.maxStars = 5,
    this.size = SizeApp.s20,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final starColor = color ?? AppColors.rating;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        return Icon(
          _getStarIcon(index),
          color: starColor,
          size: size,
        );
      }),
    );
  }

  IconData _getStarIcon(int index) {
    if (index < rating.floor()) {
      return Icons.star;
    } else if (index < rating) {
      return Icons.star_half;
    } else {
      return Icons.star_border;
    }
  }
}
