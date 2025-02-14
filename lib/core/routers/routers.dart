import 'package:commercial/core/routers/app_routes.dart';
import 'package:commercial/features/cart/presentation/pages/cart_screen.dart';
import 'package:commercial/features/home/presentation/pages/home_page.dart';
import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:commercial/features/products/presentation/pages/product_detail_screen.dart';
import 'package:commercial/features/products/presentation/pages/swiped_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      builder: (context, state) {
        final Products product = state.extra as Products;
        return ProductDetailScreen(
          products: product,
        );
      },
    ),
    GoRoute(
      path: AppRoutes.cart,
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: AppRoutes.swipedUp,
      builder: (context, state) {
        final Products product = state.extra as Products;
        return SwipedUpScreen(
          product: product,
        );
      },
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  },
);
