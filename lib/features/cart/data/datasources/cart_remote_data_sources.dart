import 'package:commercial/features/cart/data/models/cart/cart.dart';
import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/remote/api_service.dart';

abstract class CartRemoteDataSources {
  Future<List<Products>> fetchCartItems();
}

class CartRemoteDataSourcesImpl implements CartRemoteDataSources {
  final ApiService apiService;

  CartRemoteDataSourcesImpl({required this.apiService});

  @override
  Future<List<Products>> fetchCartItems() async {
    try {
      final response = await apiService.get(ApiConstants.cartItems);
      //final Cart cart = Cart.fromJsonData(response.data);
      final List<Cart> cart = (response.data as List)
          .map((json) => Cart.fromJsonData(json))
          .toList();
      List<Products> cartProducts = await getCartProducts(cart);
      return cartProducts;
    } on DioException catch (e) {
      throw ServerFailure(e.message ?? 'Server error');
    }
  }

  Future<List<Products>> getCartProducts(List<Cart> cart) async {
    final productResponse = await apiService.get(ApiConstants.products);
    final List<Products> allProducts = (productResponse.data as List)
        .map((json) => Products.fromJsonData(json))
        .toList();
    final List<Products> cartProducts = cart
        .expand((cart) => cart.products as List)
        .map((cartItem) {
          final product =
              allProducts.firstWhere((p) => p.id == cartItem.productId,
                  orElse: () => Products(
                        id: null,
                        title: "",
                        price: 0.0,
                        description: "",
                        category: "",
                        image: "",
                        quantity: 0,
                      ));
          return product.id != null
              ? Products(
                  id: product.id,
                  title: product.title,
                  price: product.price,
                  description: product.description,
                  category: product.category,
                  image: product.image,
                  quantity: cartItem.quantity,
                )
              : null;
        })
        .whereType<Products>()
        .toList();
    return cartProducts;
  }
}
