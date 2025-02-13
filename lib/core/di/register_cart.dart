import 'package:commercial/core/network/network_info.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/cart/data/datasources/cart_local_data_sources.dart';
import '../remote/api_service.dart';
import 'di.dart';
import 'package:commercial/features/cart/data/datasources/cart_remote_data_sources.dart';
import 'package:commercial/features/cart/data/repositories/cart_repositories_impl.dart';
import 'package:commercial/features/cart/domain/repositories/cart_repository.dart';
import 'package:commercial/features/cart/domain/usecases/cart_usecase.dart';
import 'package:commercial/features/cart/presentation/bloc/bloc/cart_bloc.dart';

void registerCart() {
  sl.registerLazySingleton<CartLocalDataSources>(
    () => CartLocalDataSourcesImpl(box: Hive.box('cacheCart')),
  );
  sl.registerLazySingleton<CartRemoteDataSources>(
    () => CartRemoteDataSourcesImpl(
      apiService: sl<ApiService>(),
    ),
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoriesImpl(
      cartLocalDataSource: sl<CartLocalDataSources>(),
      cartRemoteDataSources: sl<CartRemoteDataSources>(),
      networkInfo: sl<NetworkInfo>()
    ),
  );

  sl.registerLazySingleton<GetCarts>(() => GetCarts(
        cartRepository: sl<CartRepository>(),
      ));

  sl.registerFactory<CartBloc>(
    () => CartBloc(getCart: sl<GetCarts>()),
  );
}
