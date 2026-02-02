import 'package:flutter/material.dart';

import '../../../application/resource/images/app_images.dart';
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../navigation/app_navigation.dart';
import '../../navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _routeToHome();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _routeToHome() async {
    // Simulate logic
    await Future.delayed(const Duration(seconds: 1));
    AppNavigation.popAllAndRouteTo(context, AppRoutes.home);
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
        child: Image.asset(AppImages.appIcon, width: 100, height: 100),
      ),
    );
  }
}
