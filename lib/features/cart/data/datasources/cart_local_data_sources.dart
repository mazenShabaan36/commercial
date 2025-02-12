import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/errors/failures.dart';

abstract class CartLocalDataSources {
  Future<void> cacheCart(dynamic data);
  Future<dynamic> getCachedCart();
}

class CartLocalDataSourcesImpl extends CartLocalDataSources {
  final Box box;

  CartLocalDataSourcesImpl({required this.box});

  @override
  Future<void> cacheCart(data) async {
    try {
      await box.put('cacheCart', data);
    } catch (e) {
      throw CacheFailure('Failed to cache data');
    }
  }

  @override
  Future<dynamic> getCachedCart() async {
    try {
      return await box.get('cacheCart');
    } catch (e) {
      throw CacheFailure('Failed to get cached data');
    }
  }
}
