import 'package:commercial/features/home/domain/repositories/category_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCategoryData implements UseCase<dynamic, NoParams> {
  final CategoryRepository categoryRepository;

  GetCategoryData({required this.categoryRepository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await categoryRepository.fetchCategories();
  }
}
