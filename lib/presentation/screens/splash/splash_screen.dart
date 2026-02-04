import 'package:flutter/material.dart';
import 'package:todo_app/data/di/service_locator.dart';

import '../../../application/resource/images/app_images.dart';
import '../../../application/util/notification_util.dart';
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../globals/global_states/global_background/global_background_bloc.dart';
import '../../globals/global_states/global_notification/global_notification_bloc.dart';
import '../../navigation/app_navigation.dart';
import '../../navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String heroAppIconTag = 'app_icon';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _requestNotificationPermissions();
      _initBackgroundServices();
      _routeToHome();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _requestNotificationPermissions() async {
    await NotificationUtil.requestPermissions();
  }

  void _initBackgroundServices() {
    serviceLocator.get<GlobalBackgroundBloc>().initState();
    serviceLocator.get<GlobalNotificationBloc>().initState();
  }

  void _routeToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    AppNavigation.popAllAndRouteTo(
      context,
      AppRoutes.home,
      transitionDuration: const Duration(milliseconds: 1200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _renderAppBar(),
      body: _renderBody(),
    );
  }

  CustomAppBar _renderAppBar() {
    return const CustomAppBar(
      backgroundColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    );
  }

  Widget _renderBody() {
    return Container(
      margin: const EdgeInsets.only(bottom: kToolbarHeight),
      child: Center(
        child: Hero(
          tag: SplashScreen.heroAppIconTag,
          child: Image.asset(AppImages.appIcon, width: 100, height: 100),
        ),
      ),
    );
  }
}
