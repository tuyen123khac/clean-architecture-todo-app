import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';

class WrappedFilledButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const WrappedFilledButton({Key? key, required this.child, this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(76)),
        backgroundColor: AppColors.primary,
      ),
      child: child,
    );
  }
}
