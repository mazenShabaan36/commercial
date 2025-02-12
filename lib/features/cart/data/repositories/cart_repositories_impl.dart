import 'package:commercial/core/errors/failures.dart';
import 'package:commercial/features/cart/data/datasources/cart_local_data_sources.dart';
import 'package:commercial/features/cart/data/datasources/cart_remote_data_sources.dart';
import 'package:commercial/features/cart/domain/repositories/cart_repository.dart';
import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:dartz/dartz.dart';

class CartRepositoriesImpl implements CartRepository {
  final CartRemoteDataSources cartRemoteDataSources;
  final CartLocalDataSources cartLocalDataSource;

  CartRepositoriesImpl(
      {required this.cartRemoteDataSources, required this.cartLocalDataSource});

  @override
  Future<Either<Failure, List<Products>>> fetchCartsItems() async {
    try {
      final remoteData = await cartRemoteDataSources.fetchCartItems();
      await cartLocalDataSource.cacheCart(remoteData);
      return Right(remoteData);
    } on ServerFailure catch (e) {
      final cachedData = await cartLocalDataSource.getCachedCart();
      if (cachedData != null) {
        return Right(cachedData);
      }
      return Left(e);
    }
  }
}
