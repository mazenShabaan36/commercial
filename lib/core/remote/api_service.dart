import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../constants/api_constants.dart';

class ApiService {
  final Dio _dio = GetIt.I<Dio>();

  ApiService() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) async {
        Logger().e('Dio Error: ${e.message}');
        return handler.next(e);
      },
    ));
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      // log(e.message.toString());
      if (e.response?.statusCode == 403) {
        return e.response!;
      }
      throw e.message ?? "An error occurred";
    }
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      throw e.message ?? "An error occurred";
    }
  }
}
