import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class GetCarts implements UseCase<dynamic, NoParams> {
  final CartRepository cartRepository;

  GetCarts({required this.cartRepository});

  @override
  Future<Either<Failure, List<dynamic>>> call(NoParams params) async {
    return await cartRepository.fetchCartsItems();
  }
}
