import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/value_manager.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final bool showDragHandle;
  final double? maxHeightFraction;

  const BottomSheetContainer({
    super.key,
    required this.child,
    this.showDragHandle = true,
    this.maxHeightFraction,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(BorderRadiusApp.r20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDragHandle) const BottomSheetDragHandle(),
          child,
        ],
      ),
    );

    if (maxHeightFraction != null) {
      content = ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * maxHeightFraction!,
        ),
        child: content,
      );
    }

    return content;
  }
}

class BottomSheetDragHandle extends StatelessWidget {
  const BottomSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: MarginApp.m12),
      width: SizeApp.s40,
      height: SizeApp.s4,
      decoration: BoxDecoration(
        color: AppColors.bgLightGray,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r2),
      ),
    );
  }
}

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onClose;

  const BottomSheetHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ScreenPaddingApp.horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: SizeApp.s4),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textDarkGray,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onClose != null)
            GestureDetector(
              onTap: onClose,
              child: Container(
                padding: const EdgeInsets.all(PaddingApp.p8),
                decoration: BoxDecoration(
                  color: AppColors.bgLightGray,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: SizeApp.s20,
                  color: AppColors.textDarkGray,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
