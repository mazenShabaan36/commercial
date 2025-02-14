import 'package:commercial/features/products/data/models/products/rating.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/cart/data/models/cart/cart.dart';
import '../../features/cart/data/models/cart/cart_product.dart';
import '../../features/home/data/models/category.dart';
import '../../features/products/data/models/products/products.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('cacheCategory');

    // Register adapters here
    Hive.registerAdapter(CategoryAdapter());

    await Hive.openBox('cacheProduct');
    Hive.registerAdapter(ProductsAdapter());
    Hive.registerAdapter(RatingAdapter());
    Hive.registerAdapter(CartAdapter());
    Hive.registerAdapter(CartProductAdapter());
    await Hive.openBox('cacheCart');
  }
}
