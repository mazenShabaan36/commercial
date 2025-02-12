import 'package:commercial/core/di/register_category.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../hive/hive_setup.dart';
import '../remote/api_service.dart';
import 'register_cart.dart';
import 'register_products.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  await HiveSetup.init();
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiService>(() => ApiService());
  registerCategory();
  registerProducts();
  registerCart();
}
