import 'package:commercial/features/home/domain/repositories/category_repo.dart';
import 'package:commercial/features/home/domain/usecases/category_usecase.dart';
import 'package:commercial/features/home/presentation/bloc/bloc/category_bloc.dart';
import 'package:commercial/features/products/data/datasources/product_local_data_source.dart';
import 'package:commercial/features/products/data/datasources/product_remote_data_source.dart';
import 'package:commercial/features/products/domain/repositories/products_repo.dart';
import 'package:commercial/features/products/domain/usescases/products_usecase.dart';
import 'package:commercial/features/products/domain/usescases/products_with_category_usecase.dart';
import 'package:commercial/features/products/presentation/bloc/bloc/products_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/datasources/local_data_source.dart';
import '../../features/home/data/datasources/remote_data_sources.dart';
import '../../features/home/data/repositories/category_repo_impl.dart';
import '../../features/products/data/repositories/products_repo.impl.dart';
import '../hive/hive_setup.dart';
import '../remote/api_service.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  await HiveSetup.init();
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiService>(() => ApiService());

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      apiService: sl<ApiService>(),
    ),
  );
  //// register category
  sl.registerLazySingleton<CategoryLocalDataSource>(
    () => LocalDataSourceImpl(box: Hive.box('cacheCategory')),
  );

  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepoImpl(
      localDataSource: sl<CategoryLocalDataSource>(),
      remoteDataSource: sl<RemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<GetCategoryData>(() => GetCategoryData(
        categoryRepository: sl<CategoryRepository>(),
      ));

  sl.registerFactory<CategoryBloc>(
    () => CategoryBloc(getCategorydata: sl<GetCategoryData>()),
  );

  //// register products
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
