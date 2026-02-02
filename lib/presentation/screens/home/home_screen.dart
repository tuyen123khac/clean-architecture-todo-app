import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/images/app_images.dart';
import '../../../application/resource/strings/app_strings.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../navigation/app_navigation.dart';
import '../../navigation/app_routes.dart';
import '../splash/splash_screen.dart';
import 'widgets/navigation_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      titleWidget: Text(
        AppStrings.appName,
        style: AppTextStyles.bold(
          fontSize: AppFontSize.s32,
          color: AppColors.primary,
        ),
      ),
      backgroundColor: AppColors.bgWhite,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenPaddingApp.horizontal,
        ),
        child: Column(
          children: [
            _buildAppSlogan(),
            const SizedBox(height: SizeApp.s8),
            Hero(
              tag: SplashScreen.heroAppIconTag,
              child: Image.asset(AppImages.appIcon, width: 120, height: 120),
            ),
            const SizedBox(height: SizeApp.s8),
            _buildNavigationCards(context),
            const Spacer(),
            _buildFooter(),
            const SizedBox(height: SizeApp.s16),
          ],
        ),
      ),
    );
  }

  Widget _buildAppSlogan() {
    return Text(
      AppStrings.appSlogan,
      style: AppTextStyles.bold(
        fontSize: AppFontSize.s14,
        color: AppColors.textDarkGray,
      ),
    );
  }

  Widget _buildNavigationCards(BuildContext context) {
    return Column(
      children: [
        NavigationCard(
          title: AppStrings.salesTeam,
          subtitle: AppStrings.salesTeamSubtitle,
          icon: Icons.people_outline,
          onTap: () => AppNavigation.routeTo(context, AppRoutes.salesTeam),
        ),
        const SizedBox(height: SizeApp.s16),
        NavigationCard(
          title: AppStrings.buyJewelry,
          subtitle: AppStrings.buyJewelrySubtitle,
          icon: Icons.diamond_outlined,
          iconBackgroundColor: AppColors.secondary.withValues(alpha: 0.3),
          onTap: () => AppNavigation.routeTo(context, AppRoutes.buyJewelry),
        ),
        const SizedBox(height: SizeApp.s16),
        NavigationCard(
          title: AppStrings.sellYourJewelry,
          subtitle: AppStrings.sellYourJewelrySubtitle,
          icon: Icons.sell_outlined,
          iconBackgroundColor: AppColors.bgLightGray,
          onTap: () {
            // TODO: Navigate to sell jewelry screen
          },
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Text(
      AppStrings.appDesc,
      style: AppTextStyles.regular(
        fontSize: AppFontSize.s10,
        color: AppColors.textDarkGray,
      ),
    );
  }
}
