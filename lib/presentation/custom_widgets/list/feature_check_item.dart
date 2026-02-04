import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';

class FeatureCheckItem extends StatelessWidget {
  final String text;
  final Color? checkColor;
  final Color? checkBackgroundColor;

  const FeatureCheckItem({
    super.key,
    required this.text,
    this.checkColor,
    this.checkBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingApp.p8),
      child: Row(
        children: [
          Container(
            width: SizeApp.s24,
            height: SizeApp.s24,
            decoration: BoxDecoration(
              color: checkBackgroundColor ?? AppColors.infoLight,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: checkColor ?? AppColors.info,
              size: SizeApp.s16,
            ),
          ),
          const SizedBox(width: SizeApp.s12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.regular(
                fontSize: AppFontSize.s14,
                color: AppColors.textDarkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
