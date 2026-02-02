import 'package:flutter/material.dart';
import 'package:todo_app/presentation/custom_widgets/button/custom_filled_button.dart';

import '../../navigation/app_navigation.dart';
import '../../navigation/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFilledButton(
              label: 'to sales',
              onPressed: () {
                AppNavigation.routeTo(context, AppRoutes.salesTeam);
              },
            ),
          ],
        ),
      ),
    );
  }
}
