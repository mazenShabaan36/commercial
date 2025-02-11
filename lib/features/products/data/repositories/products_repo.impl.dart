import 'package:commercial/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/products_repo.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepoImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;

  ProductRepoImpl(
      {required this.remoteDataSource, required this.localDataSource});
  @override
  Future<Either<Failure, dynamic>> fetchProducts() async {
    try {
      final remoteData = await remoteDataSource.fetchProducts();
      await localDataSource.cacheProduct(remoteData);
      return Right(remoteData);
    } on ServerFailure catch (e) {
      final cachedData = await localDataSource.getCachedProducts();
      if (cachedData != null) {
        return Right(cachedData);
      }
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, dynamic>> fetchProductsWithCategory(
      String category) async {
    try {
      final remoteData =
          await remoteDataSource.fetchProductWithCategory(category);
      return Right(remoteData);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
