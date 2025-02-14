import 'package:cached_network_image/cached_network_image.dart';
import 'package:commercial/core/utils/app_strings.dart';
import 'package:commercial/core/widgets/custom_button.dart';
import 'package:commercial/features/cart/presentation/widgets/build_summary_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routers/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';
import '../../data/models/products/products.dart';

class SwipedUpScreen extends StatelessWidget {
  const SwipedUpScreen({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(product.title.toString()),
          leading: GestureDetector(
            onTap: () {
              context.go(
                AppRoutes.productDetails,
                extra: product,
              );
            },
            child: Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                AppAssets.arrowBackIcon,
                color: AppColors.mainColor,
                height: height(context) * 0.025,
                width: width(context) * 0.025,
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context) * 0.04,
            vertical: height(context) * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: product.image.toString(),
                height: height(context) * 0.3,
                width: width(context) * 0.6,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height(context) * 0.02,
            ),
            BuildSummaryRow(title: '', value: product.description.toString()),
            SizedBox(
              height: height(context) * 0.02,
            ),
            BuildSummaryRow(
                title: AppStrings.price, value: ' ${product.price.toString()}'),
            SizedBox(
              height: height(context) * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Expanded(
                  child: BuildSummaryRow(
                      title: AppStrings.rating,
                      value: ' ${product.rating!.rate.toString()}'),
                ),
              ],
            ),
            SizedBox(
              height: height(context) * 0.02,
            ),
            SizedBox(
              width: width(context) * 0.55,
              child: CustomButton(
                  text: AppStrings.addToCart,
                  onPressed: () {
                    context.go(AppRoutes.cart);
                  },
                  backgroundColor: AppColors.mainColor,
                  borderRadius: 40,
                  padding: 8),
            )
          ],
        ),
      ),
    );
  }
}
