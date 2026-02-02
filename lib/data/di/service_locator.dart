import 'dart:async';
import 'dart:ui';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../presentation/globals/global_states/global_ui/global_ui_bloc.dart';
import '../../presentation/screens/sales_team/bloc/sales_team_bloc.dart';

// Global service locator instance.
final serviceLocator = GetIt.instance;

FutureOr<void> injectDependencies() async {
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
  _registerStates();
}

void _registerDataSources() {
  // serviceLocator.registerSingleton<SharedPref>(SharedPref());

  // serviceLocator.registerSingleton<FlutterSecureStorage>(
  //   const FlutterSecureStorage(
  //     iOptions: IOSOptions(
  //       accessibility: KeychainAccessibility.first_unlock_this_device,
  //     ),
  //   ),
  // );

  // serviceLocator.registerSingleton<KeyValueStorage>(
  //   KeyValueStorageImpl(serviceLocator.get<FlutterSecureStorage>()),
  // );

  // serviceLocator.registerSingleton<InternetConnection>(InternetConnection());

  // serviceLocator.registerSingleton<NetworkDio>(
  //   NetworkDio(
  //     // TODO: use app env
  //     baseUrl:
  //         'https://invizauri-dev-containerapp.gentleisland-c36c2df9.eastus.azurecontainerapps.io/patient',
  //     tokenManager: serviceLocator.get<KeyValueStorage>(),
  //   ),
  // );
}

void _registerRepositories() {}

void _registerUseCases() {}

void _registerStates() {
  // ******************* Global States *******************

  serviceLocator.registerSingleton<GlobalUiBloc>(
    GlobalUiBloc(locale: const Locale('en')),
  );

  // ******************* Screen States *******************

  serviceLocator.registerFactory(() {
    return SalesTeamBloc();
  });
}
