import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/models/category.dart';
import '../../features/products/data/models/products/products.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('cacheCategory');

    // Register adapters here
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(ProductsAdapter());
    await Hive.openBox('cacheProduct');
  }
}
