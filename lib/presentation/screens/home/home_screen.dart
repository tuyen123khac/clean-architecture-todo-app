import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/images/app_images.dart';
import '../../../application/resource/strings/app_strings.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../../application/util/notification_util.dart';
import '../../../data/di/service_locator.dart';
import '../../../domain/entities/notification/notification_entity.dart';
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../globals/global_states/global_background/global_background_bloc.dart';
import '../../globals/global_states/global_background/global_background_bloc_selector.dart';
import '../../navigation/app_navigation.dart';
import '../../navigation/app_routes.dart';
import '../splash/splash_screen.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc_listener.dart';
import 'bloc/home_bloc_selector.dart';
import 'widgets/navigation_card.dart';
import 'widgets/notification_bell.dart';
import 'widgets/sync_status_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bloc = serviceLocator.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  // ==================== Notification Handler ====================

  void _onNotificationReceived(
    BuildContext context,
    NotificationEntity notification,
  ) {
    NotificationUtil.showNotification(
      id: notification.id.hashCode,
      title: notification.title,
      body: notification.body,
      payload: 'route:${AppRoutes.notification}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: HomeNotificationListener(
        listener: _onNotificationReceived,
        child: PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            appBar: _buildAppBar(),
            body: _buildBody(context),
          ),
        ),
      ),
    );
  }

  // ==================== App Bar ====================

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
      actionButtons: const [NotificationBell()],
    );
  }

  // ==================== Body ====================

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
            const SizedBox(height: SizeApp.s16),
            _buildSyncCard(context),
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
    return HomeCountersSelector(
      builder: (counters) {
        return Column(
          children: [
            // ==================== Sales Team Card ====================
            NavigationCard(
              title: AppStrings.salesTeam,
              subtitle: AppStrings.salesTeamSubtitle,
              icon: Icons.people_outline,
              onTap: () => AppNavigation.routeTo(context, AppRoutes.salesTeam),
            ),
            const SizedBox(height: SizeApp.s16),

            // ==================== Buy Jewelry Card ====================
            NavigationCard(
              title: AppStrings.buyJewelry,
              subtitle: AppStrings.buyJewelrySubtitle,
              icon: Icons.diamond_outlined,
              iconBackgroundColor: AppColors.secondary.withValues(alpha: 0.3),
              badgeCount: counters.wishlist,
              badgeColor: AppColors.secondary,
              onTap: () => AppNavigation.routeTo(context, AppRoutes.buyJewelry),
            ),
            const SizedBox(height: SizeApp.s16),

            // ==================== Sell Jewelry Card ====================
            NavigationCard(
              title: AppStrings.sellYourJewelry,
              subtitle: AppStrings.sellYourJewelrySubtitle,
              icon: Icons.sell_outlined,
              iconBackgroundColor: AppColors.bgLightGray,
              badgeCount: counters.sell,
              badgeColor: AppColors.primary,
              onTap: () =>
                  AppNavigation.routeTo(context, AppRoutes.sellJewelry),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSyncCard(BuildContext context) {
    return GlobalBackgroundSyncCardSelector(
      builder: (syncData) {
        return HomePendingSyncCountSelector(
          builder: (pendingSyncCount) {
            return SyncStatusCard(
              syncStatus: syncData.syncStatus,
              pendingSyncCount: pendingSyncCount,
              lastSyncedAt: syncData.lastSyncedAt,
              isOnline: syncData.isOnline,
              onTap: () {
                context.read<GlobalBackgroundBloc>().triggerSync();
              },
            );
          },
        );
      },
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
