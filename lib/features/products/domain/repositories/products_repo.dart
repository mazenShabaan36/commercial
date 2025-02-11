import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class ProductsRepository {
  Future<Either<Failure, dynamic>> fetchProducts();
  Future<Either<Failure, dynamic>> fetchProductsWithCategory(String category);
}
