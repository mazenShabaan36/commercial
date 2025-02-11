import 'package:commercial/core/errors/failures.dart';
import 'package:commercial/features/home/domain/repositories/category_repo.dart';
import 'package:dartz/dartz.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_sources.dart';

class CategoryRepoImpl implements CategoryRepository {
  final RemoteDataSource remoteDataSource;
  final CategoryLocalDataSource localDataSource;

  CategoryRepoImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, dynamic>> fetchCategories() async {
    try {
      final remoteData = await remoteDataSource.fetchCategories();
      await localDataSource.cacheCategory(remoteData);
      return Right(remoteData);
    } on ServerFailure catch (e) {
      final cachedData = await localDataSource.getCachedCategories();
      if (cachedData != null) {
        return Right(cachedData);
      }
      return Left(e);
    }
  }
}
