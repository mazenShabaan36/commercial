import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/remote/api_service.dart';

abstract class ProductsRemoteDataSource {
  Future<dynamic> fetchProducts();
  Future<dynamic> fetchProductWithCategory(String category);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiService apiService;

  ProductsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<dynamic> fetchProducts() async {
    try {
      final response = await apiService.get(ApiConstants.products);
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Server error');
    }
  }

  @override
  Future fetchProductWithCategory(String category) async {
    try {
      final response =
          await apiService.get(ApiConstants.productsInCategory + category);
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Server error');
    }
  }
}
