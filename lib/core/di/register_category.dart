
import 'package:commercial/core/di/di.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/datasources/local_data_source.dart';
import '../../features/home/data/datasources/remote_data_sources.dart';
import '../../features/home/data/repositories/category_repo_impl.dart';
import 'package:commercial/features/home/domain/repositories/category_repo.dart';
import 'package:commercial/features/home/domain/usecases/category_usecase.dart';
import 'package:commercial/features/home/presentation/bloc/bloc/category_bloc.dart';

import '../remote/api_service.dart';
void registerCategory() {
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
}