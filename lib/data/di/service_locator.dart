import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_app/application/app_config.dart';
import 'package:todo_app/data/data_source/local/drift/app_database.dart';
import 'package:todo_app/data/data_source/local/drift/buy_jewelry/buy_jewelry_wishlist_local_datasource.dart';
import 'package:todo_app/data/data_source/local/drift/buy_jewelry/buy_jewelry_wishlist_local_datasource_impl.dart';
import 'package:todo_app/data/data_source/local/drift/sell_jewelry/sell_jewelry_local_datasource.dart';
import 'package:todo_app/data/data_source/local/drift/sell_jewelry/sell_jewelry_local_datasource_impl.dart';
import 'package:todo_app/data/data_source/network/dio_client.dart';
import 'package:todo_app/data/data_source/network/remote_data_source.dart';
import 'package:todo_app/presentation/globals/global_states/global_background/global_background_bloc.dart';
import 'package:todo_app/presentation/globals/global_states/global_notification/global_notification_bloc.dart';
import 'package:todo_app/presentation/globals/global_states/global_ui/global_ui_bloc.dart';
import 'package:todo_app/presentation/screens/buy_jewelry/bloc/buy_jewelry_bloc.dart';
import 'package:todo_app/presentation/screens/home/bloc/home_bloc.dart';
import 'package:todo_app/presentation/screens/jewelry_detail/bloc/jewelry_detail_bloc.dart';
import 'package:todo_app/presentation/screens/sales_team/bloc/sales_team_bloc.dart';
import 'package:todo_app/presentation/screens/sell_jewelry/bloc/sell_jewelry_bloc.dart';

import '../../domain/repositories/buy_jewelry/buy_jewelry_repository.dart';
import '../../domain/repositories/marketing_notification/marketing_notification_repository.dart';
import '../../domain/repositories/sales_member/sales_member_repository.dart';
import '../../domain/repositories/sell_jewelry/sell_jewelry_repository.dart';
import '../../domain/use_cases/buy_jewelry/add_to_wishlist.dart';
import '../../domain/use_cases/buy_jewelry/get_all_wishlist.dart';
import '../../domain/use_cases/buy_jewelry/get_jewelry_list.dart';
import '../../domain/use_cases/buy_jewelry/remove_from_wishlist.dart';
import '../../domain/use_cases/buy_jewelry/watch_wishlist.dart';
import '../../domain/use_cases/marketing_notification/start_notification_scheduler.dart';
import '../../domain/use_cases/marketing_notification/stop_notification_scheduler.dart';
import '../../domain/use_cases/marketing_notification/watch_marketing_notifications.dart';
import '../../domain/use_cases/sales_member/get_sales_members.dart';
import '../../domain/use_cases/sell_jewelry/add_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/delete_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/get_pending_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/sync_all_pending_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/update_sell_jewelry.dart';
import '../../domain/use_cases/sell_jewelry/watch_sell_jewelry.dart';
import '../data_source/local/mock/marketing_notification_mock_data.dart';
import '../repositories/buy_jewelry/buy_jewelry_repository_impl.dart';
import '../repositories/marketing_notification/marketing_notification_repository_impl.dart';
import '../repositories/sales_member/sales_member_repository.impl.dart';
import '../repositories/sell_jewelry/sell_jewelry_repository_impl.dart';

// Global service locator instance.
final serviceLocator = GetIt.instance;

void injectDependencies() {
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
    SellJewelryRepositoryImpl(
      serviceLocator.get<SellJewelryLocalDatasource>(),
      serviceLocator.get<RemoteDataSource>(),
    ),
  );

  // Marketing Notification
  serviceLocator.registerSingleton<MarketingNotificationMockData>(
    MarketingNotificationMockData(),
  );

  serviceLocator.registerSingleton<MarketingNotificationRepository>(
    MarketingNotificationRepositoryImpl(
      serviceLocator.get<MarketingNotificationMockData>(),
    ),
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

  serviceLocator.registerLazySingleton<GetPendingSellJewelry>(
    () => GetPendingSellJewelry(serviceLocator.get<SellJewelryRepository>()),
  );

  serviceLocator.registerLazySingleton<SyncAllPendingSellJewelry>(
    () =>
        SyncAllPendingSellJewelry(serviceLocator.get<SellJewelryRepository>()),
  );

  // Marketing Notification Use Cases
  serviceLocator.registerLazySingleton<WatchMarketingNotifications>(
    () => WatchMarketingNotifications(
      serviceLocator.get<MarketingNotificationRepository>(),
    ),
  );

  serviceLocator.registerLazySingleton<StartNotificationScheduler>(
    () => StartNotificationScheduler(
      serviceLocator.get<MarketingNotificationRepository>(),
    ),
  );

  serviceLocator.registerLazySingleton<StopNotificationScheduler>(
    () => StopNotificationScheduler(
      serviceLocator.get<MarketingNotificationRepository>(),
    ),
  );
}

void _registerStates() {
  // ******************* Global States *******************

  serviceLocator.registerSingleton<GlobalUiBloc>(
    GlobalUiBloc(locale: const Locale('en')),
  );

  serviceLocator.registerSingleton<GlobalBackgroundBloc>(
    GlobalBackgroundBloc(
      serviceLocator.get<SyncAllPendingSellJewelry>(),
      serviceLocator.get<GetPendingSellJewelry>(),
      serviceLocator.get<InternetConnection>(),
    ),
  );

  serviceLocator.registerSingleton<GlobalNotificationBloc>(
    GlobalNotificationBloc(
      serviceLocator.get<WatchMarketingNotifications>(),
      serviceLocator.get<StartNotificationScheduler>(),
      serviceLocator.get<StopNotificationScheduler>(),
    ),
  );

  // ******************* Screen States *******************

  serviceLocator.registerFactory(() {
    return HomeBloc(
      serviceLocator.get<WatchWishlist>(),
      serviceLocator.get<WatchSellJewelry>(),
      serviceLocator.get<WatchMarketingNotifications>(),
    );
  });

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
      serviceLocator.get<GlobalBackgroundBloc>(),
    );
  });
}
