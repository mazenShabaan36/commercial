import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/products_repo.dart';

class GetProductsWithCategory implements UseCase<dynamic, String> {
  final ProductsRepository productsRepository;

  GetProductsWithCategory({required this.productsRepository});
  @override
  Future<Either<Failure, dynamic>> call(String params) async {
    return await productsRepository.fetchProductsWithCategory(params);
  }
}
