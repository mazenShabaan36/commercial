import 'dart:developer';

import 'package:commercial/core/errors/failures.dart';
import 'package:commercial/features/home/domain/repositories/category_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_sources.dart';

class CategoryRepoImpl implements CategoryRepository {
  final RemoteDataSource remoteDataSource;
  final CategoryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CategoryRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, dynamic>> fetchCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.fetchCategories();
        await localDataSource.cacheCategory(remoteData);
        return Right(remoteData);
      } catch (e) {
        log('error $e');
      }
      return Left(ServerFailure("No internet & no cached data available."));
    } else {
      final cachedData = await localDataSource.getCachedCategories();
      if (cachedData != null) {
        return Right(cachedData);
      }
      return Left(CacheFailure("No internet & no cached data available."));
    }
  }
}
