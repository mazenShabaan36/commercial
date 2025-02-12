import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../products/data/models/products/products.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Products>>> fetchCartsItems();
}
