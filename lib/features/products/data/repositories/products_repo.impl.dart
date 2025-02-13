import 'dart:developer';

import 'package:commercial/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/products_repo.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepoImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepoImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, dynamic>> fetchProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.fetchProducts();
        log(remoteData.runtimeType.toString());

        await localDataSource.cacheProduct(remoteData);
        return Right(remoteData);
      } on ServerFailure catch (e) {
        return Left(e);
      }
    } else {
      final cachedData = await localDataSource.getCachedProducts();
      if (cachedData != null) {
        return Right(cachedData);
      }
      return Left(CacheFailure("No internet & no cached data available."));
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
