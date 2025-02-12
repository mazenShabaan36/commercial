import 'package:commercial/core/routers/app_routes.dart';
import 'package:commercial/core/utils/app_assets.dart';
import 'package:commercial/core/utils/app_colors.dart';
import 'package:commercial/core/utils/app_strings.dart';
import 'package:commercial/core/utils/size.dart';
import 'package:commercial/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/text.dart';
import '../bloc/bloc/cart_bloc.dart';
import '../widgets/checkout_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.cart, style: Styles.style16mainClrL),
        backgroundColor: AppColors.colorWhiteLight,
        foregroundColor: AppColors.mainColor,
        elevation: 0,
        leadingWidth: width(context) * 0.1,
        leading: GestureDetector(
          onTap: () {
            context.go(AppRoutes.home);
          },
          child: SvgPicture.asset(
            AppAssets.arrowBackIcon,
            color: AppColors.mainColor,
            height: height(context) * 0.02,
            width: width(context) * 0.02,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I<CartBloc>()..add(GetCart()),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.cartProducts.length,
                      itemBuilder: (context, index) {
                        final item = state.cartProducts[index];
                        return CartItemCard(item: item, index: index);
                      },
                    ),
                  ),
                  CheckOutSection(
                    state: state,
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
