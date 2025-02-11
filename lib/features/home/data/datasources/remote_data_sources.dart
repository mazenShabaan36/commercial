import 'package:commercial/core/remote/api_service.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';

abstract class RemoteDataSource {
  Future<dynamic> fetchCategories();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl({required this.apiService});

  @override
  Future<dynamic> fetchCategories() async {
    try {
      final response = await apiService.get(ApiConstants.categories);
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Server error');
    }
  }
}
