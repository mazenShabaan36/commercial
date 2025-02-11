import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/errors/failures.dart';

abstract class CategoryLocalDataSource {
  Future<void> cacheCategory(dynamic data);
  Future<dynamic> getCachedCategories();
}

class LocalDataSourceImpl implements CategoryLocalDataSource {
  final Box box;

  LocalDataSourceImpl({required this.box});

  @override
  Future<void> cacheCategory(dynamic data) async {
    try {
      await box.put('cacheCategory', data);
    } catch (e) {
      throw CacheFailure('Failed to cache data');
    }
  }

  @override
  Future<dynamic> getCachedCategories() async {
    try {
      return box.get('cacheCategory');
    } catch (e) {
      throw CacheFailure('Failed to get cached data');
    }
  }
}
