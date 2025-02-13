import 'package:commercial/core/di/di.dart';
import 'package:commercial/core/network/network_info.dart';
import 'package:commercial/features/products/data/datasources/product_local_data_source.dart';
import 'package:commercial/features/products/data/datasources/product_remote_data_source.dart';
import 'package:commercial/features/products/domain/repositories/products_repo.dart';
import 'package:commercial/features/products/domain/usescases/products_usecase.dart';
import 'package:commercial/features/products/domain/usescases/products_with_category_usecase.dart';
import 'package:commercial/features/products/presentation/bloc/bloc/products_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../features/products/data/repositories/products_repo.impl.dart';
import '../remote/api_service.dart';

void registerProducts() {
  sl.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductLocalDataSourceImpl(box: Hive.box('cacheProduct')),
  );
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(
      apiService: sl<ApiService>(),
    ),
  );

  sl.registerLazySingleton<ProductsRepository>(
    () => ProductRepoImpl(
      localDataSource: sl<ProductsLocalDataSource>(),
      remoteDataSource: sl<ProductsRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>()
    ),
  );

  sl.registerLazySingleton<GetProducts>(() => GetProducts(
        productsRepository: sl<ProductsRepository>(),
      ));
  sl.registerLazySingleton<GetProductsWithCategory>(
      () => GetProductsWithCategory(
            productsRepository: sl<ProductsRepository>(),
          ));
  sl.registerFactory<ProductsBloc>(
    () => ProductsBloc(
      getProducts: sl<GetProducts>(),
      getProductsWithCategory: sl<GetProductsWithCategory>(),
    ),
  );
}
