import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final int age;

  const ProfileImage({super.key, required this.imageUrl, required this.age});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeApp.s80,
      height: SizeApp.s80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [_buildAvatar(), _buildAge()],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: SizeApp.s80,
      height: SizeApp.s80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: BorderWidthApp.w2),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: '$imageUrl?w=200&h=200&fit=crop',
          fit: BoxFit.cover,
          memCacheWidth: 200,
          memCacheHeight: 200,
          placeholder: (context, url) => Container(
            color: AppColors.bgLightGray,
            child: const Center(
              child: SizedBox(
                width: SizeApp.s24,
                height: SizeApp.s24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: AppColors.bgLightGray,
            child: Icon(
              Icons.person,
              size: SizeApp.s40,
              color: AppColors.textGray,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAge() {
    return Positioned(
      bottom: -SizeApp.s4,
      left: SizeApp.s0,
      right: SizeApp.s0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingApp.p8,
            vertical: PaddingApp.p4,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
          ),
          child: Text(
            age.toString(),
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
