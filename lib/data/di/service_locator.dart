import 'dart:async';
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_app/application/app_config.dart';
import 'package:todo_app/data/data_source/local/drift/app_database.dart';
import 'package:todo_app/data/data_source/local/drift/buy_jewelry/buy_jewelry_wishlist_local_datasource.dart';
import 'package:todo_app/data/data_source/local/drift/buy_jewelry/buy_jewelry_wishlist_local_datasource_impl.dart';
import 'package:todo_app/data/data_source/local/drift/sell_jewelry/sell_jewelry_local_datasource.dart';
import 'package:todo_app/data/data_source/local/drift/sell_jewelry/sell_jewelry_local_datasource_impl.dart';
import 'package:todo_app/data/data_source/network/remote_data_source.dart';
import 'package:todo_app/data/data_source/network/dio_client.dart';
import 'package:todo_app/presentation/globals/global_states/global_ui/global_ui_bloc.dart';
import 'package:todo_app/presentation/screens/buy_jewelry/bloc/buy_jewelry_bloc.dart';
import 'package:todo_app/presentation/screens/jewelry_detail/bloc/jewelry_detail_bloc.dart';
import 'package:todo_app/presentation/screens/sales_team/bloc/sales_team_bloc.dart';
import 'package:todo_app/presentation/screens/sell_jewelry/bloc/sell_jewelry_bloc.dart';


import '../../domain/repositories/buy_jewelry/buy_jewelry_repository.dart';
import '../../domain/use_cases/buy_jewelry/add_to_wishlist.dart';
import '../../domain/use_cases/buy_jewelry/get_all_wishlist.dart';
import '../../domain/use_cases/buy_jewelry/get_jewelry_list.dart';
import '../../domain/use_cases/buy_jewelry/remove_from_wishlist.dart';
import '../../domain/use_cases/buy_jewelry/watch_wishlist.dart';
import '../../domain/use_cases/sales_member/get_sales_members.dart';
import '../../domain/use_cases/sell_jewelry/add_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/delete_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/update_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/watch_sell_jewelry.dart';
import '../repositories/buy_jewelry/buy_jewelry_repository_impl.dart';
import '../../domain/repositories/sales_member/sales_member_repository.dart';
import '../repositories/sales_member/sales_member_repository.impl.dart';
import '../../domain/repositories/sell_jewelry/sell_jewelry_repository.dart';
import '../repositories/sell_jewelry/sell_jewelry_repository_impl.dart';

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

  // Local data sources
  serviceLocator.registerSingleton<AppDatabase>(AppDatabase());

  serviceLocator.registerSingleton<BuyJewelryWishlistLocalDatasource>(
    BuyJewelryWishlistLocalDatasourceImpl(serviceLocator.get<AppDatabase>()),
  );

  serviceLocator.registerSingleton<SellJewelryLocalDatasource>(
    SellJewelryLocalDatasourceImpl(serviceLocator.get<AppDatabase>()),
  );
}

void _registerRepositories() {
  serviceLocator.registerSingleton<SalesMemberRepository>(
    SalesMemberRepositoryImpl(serviceLocator.get<RemoteDataSource>()),
  );

  serviceLocator.registerSingleton<BuyJewelryRepository>(
    BuyJewelryRepositoryImpl(
      serviceLocator.get<RemoteDataSource>(),
      serviceLocator.get<BuyJewelryWishlistLocalDatasource>(),
    ),
  );

  serviceLocator.registerSingleton<SellJewelryRepository>(
    SellJewelryRepositoryImpl(serviceLocator.get<SellJewelryLocalDatasource>()),
  );
}

void _registerUseCases() {
  serviceLocator.registerLazySingleton<GetSalesMembers>(
    () => GetSalesMembers(serviceLocator.get<SalesMemberRepository>()),
  );

  serviceLocator.registerLazySingleton<GetJewelryList>(
    () => GetJewelryList(serviceLocator.get<BuyJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<GetAllWishlist>(
    () => GetAllWishlist(serviceLocator.get<BuyJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<WatchWishlist>(
    () => WatchWishlist(serviceLocator.get<BuyJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<AddToWishlist>(
    () => AddToWishlist(serviceLocator.get<BuyJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<RemoveFromWishlist>(
    () => RemoveFromWishlist(serviceLocator.get<BuyJewelryRepository>()),
  );

  // Sell Jewelry Use Cases
  serviceLocator.registerLazySingleton<WatchSellJewelry>(
    () => WatchSellJewelry(serviceLocator.get<SellJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<AddSellJewelry>(
    () => AddSellJewelry(serviceLocator.get<SellJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<UpdateSellJewelry>(
    () => UpdateSellJewelry(serviceLocator.get<SellJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<DeleteSellJewelry>(
    () => DeleteSellJewelry(serviceLocator.get<SellJewelryRepository>()),
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
    return BuyJewelryBloc(
      serviceLocator.get<GetJewelryList>(),
      serviceLocator.get<GetAllWishlist>(),
      serviceLocator.get<WatchWishlist>(),
      serviceLocator.get<AddToWishlist>(),
      serviceLocator.get<RemoveFromWishlist>(),
    );
  });

  serviceLocator.registerFactory(() {
    return JewelryDetailBloc(
      serviceLocator.get<AddToWishlist>(),
      serviceLocator.get<RemoveFromWishlist>(),
      serviceLocator.get<AddSellJewelry>(),
    );
  });

  serviceLocator.registerFactory(() {
    return SellJewelryBloc(
      serviceLocator.get<WatchSellJewelry>(),
      serviceLocator.get<AddSellJewelry>(),
      serviceLocator.get<UpdateSellJewelry>(),
      serviceLocator.get<DeleteSellJewelry>(),
      serviceLocator.get<InternetConnection>(),
    );
  });
}
