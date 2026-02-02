import 'dart:async';
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:todo_app/application/app_config.dart';
import 'package:todo_app/data/data_source/network/api_client.dart';
import 'package:todo_app/data/data_source/network/jewelry_remote_data_source.dart';
import 'package:todo_app/data/data_source/network/sell_remote_data_source.dart';
import 'package:todo_app/data/data_source/network/to_call_remote_data_source.dart';
import 'package:todo_app/presentation/globals/global_states/global_ui/global_ui_bloc.dart';
import 'package:todo_app/presentation/screens/buy_jewelry/bloc/buy_jewelry_bloc.dart';
import 'package:todo_app/presentation/screens/sales_team/bloc/sales_team_bloc.dart';

// Global service locator instance.
final serviceLocator = GetIt.instance;

FutureOr<void> injectDependencies() async {
  _registerConfig();
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
  _registerStates();
}

void _registerConfig() {
  serviceLocator.registerSingleton<AppConfig>(
    const AppConfig(env: AppEnvironment.dev),
  );
}

void _registerDataSources() {
  serviceLocator.registerSingleton<ApiClient>(
    ApiClient(isMock: serviceLocator.get<AppConfig>().isMock),
  );

  serviceLocator.registerSingleton<ToCallRemoteDataSource>(
    ToCallRemoteDataSourceImpl(serviceLocator.get<ApiClient>()),
  );

  serviceLocator.registerSingleton<JewelryRemoteDataSource>(
    JewelryRemoteDataSourceImpl(serviceLocator.get<ApiClient>()),
  );

  serviceLocator.registerSingleton<SellRemoteDataSource>(
    SellRemoteDataSourceImpl(serviceLocator.get<ApiClient>()),
  );
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
    return SalesTeamBloc(serviceLocator.get<ToCallRemoteDataSource>());
  });

  serviceLocator.registerFactory(() {
    return BuyJewelryBloc(serviceLocator.get<JewelryRemoteDataSource>());
  });
}
