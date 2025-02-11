import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class CategoryRepository {
  Future<Either<Failure, dynamic>> fetchCategories();
}
