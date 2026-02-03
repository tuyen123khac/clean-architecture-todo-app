import 'dart:async';
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_app/application/app_config.dart';
import 'package:todo_app/data/data_source/network/remote_data_source.dart';
import 'package:todo_app/data/data_source/network/dio_client.dart';
import 'package:todo_app/presentation/globals/global_states/global_ui/global_ui_bloc.dart';
import 'package:todo_app/presentation/screens/buy_jewelry/bloc/buy_jewelry_bloc.dart';
import 'package:todo_app/presentation/screens/sales_team/bloc/sales_team_bloc.dart';

import '../../domain/use_cases/sales_member/get_sales_members.dart';
import '../repositories/sales_member/sales_member_repository.dart';
import '../repositories/sales_member/sales_member_repository.impl.dart';

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
  serviceLocator.registerSingleton<AppConfig>(AppConfig());
}

void _registerDataSources() {
  serviceLocator.registerSingleton<InternetConnection>(InternetConnection());

  final appConfig = serviceLocator.get<AppConfig>();
  serviceLocator.registerSingleton<DioClient>(
    DioClient(
      baseUrl: AppConfig.appEnv.endpoint,
      connectionChecker: serviceLocator.get<InternetConnection>(),
      isMock: appConfig.isMock,
    ),
  );

  serviceLocator.registerSingleton<RemoteDataSource>(
    RemoteDataSource(serviceLocator.get<DioClient>()),
  );
}

void _registerRepositories() {
  serviceLocator.registerSingleton<SalesMemberRepository>(
    SalesMemberRepositoryImpl(serviceLocator.get<RemoteDataSource>()),
  );
}

void _registerUseCases() {
  serviceLocator.registerLazySingleton<GetSalesMembers>(
    () => GetSalesMembers(serviceLocator.get<SalesMemberRepository>()),
  );
}

void _registerStates() {
  // ******************* Global States *******************

  serviceLocator.registerSingleton<GlobalUiBloc>(
    GlobalUiBloc(locale: const Locale('en')),
  );


  // ******************* Screen States *******************

  serviceLocator.registerFactory(() {
    return SalesTeamBloc(serviceLocator.get<GetSalesMembers>());
  });

  serviceLocator.registerFactory(() {
    return BuyJewelryBloc();
  });
}
