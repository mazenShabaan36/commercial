import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:commercial/features/products/presentation/bloc/bloc/products_bloc.dart';
import 'package:commercial/features/products/presentation/widgets/product_card.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/change_to_map_string_dynamic.dart';
import '../../../../core/routers/app_routes.dart';
import 'products_grid_loading.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
        stream: sl<Connectivity>().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data!.last != ConnectivityResult.none) {
            context.read<ProductsBloc>().add(FetchProducts());
          }
          return BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const ProductsGridLoading();
              } else if (state is ProductsLoaded) {
                final products = state.productsList.map((item) {
                  if (item is Map<dynamic, dynamic>) {
                    // log(item);
                    final convertedItem = convertToMapStringDynamic(item);
                    return Products.fromJsonData(convertedItem);
                  } else {
                    Products.fromJsonData(item);
                  }
                }).toList();
                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 4,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            context.go(AppRoutes.productDetails,
                                extra: products[index]);
                          },
                          child: ProductCard(products: products[index]));
                    },
                  ),
                );
              } else if (state is ProductsFailure) {
                return Text('${state.message}');
              } else {
                return Container();
              }
            },
          );
        });
  }
}
