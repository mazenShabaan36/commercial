import 'package:commercial/core/errors/failures.dart';
import 'package:commercial/features/products/domain/repositories/products_repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class GetProducts implements UseCase<dynamic, NoParams> {
  final ProductsRepository productsRepository;

  GetProducts({required this.productsRepository});
  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await productsRepository.fetchProducts();
  }
}
