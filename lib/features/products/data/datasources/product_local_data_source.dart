import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/errors/failures.dart';

abstract class ProductsLocalDataSource {
  Future<void> cacheProduct(dynamic data);
  Future<dynamic> getCachedProducts();
}

class ProductLocalDataSourceImpl implements ProductsLocalDataSource {
  final Box box;

  ProductLocalDataSourceImpl({required this.box});

  @override
  Future<void> cacheProduct(dynamic data) async {
    try {
      await box.put('cacheProduct', data);
    } catch (e) {
      throw CacheFailure('Failed to cache data');
    }
  }

  @override
  Future<dynamic> getCachedProducts() async {
    try {
      return box.get('cacheProduct');
    } catch (e) {
      throw CacheFailure('Failed to get cached data');
    }
  }
}
