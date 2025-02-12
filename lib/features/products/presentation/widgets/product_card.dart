import 'package:cached_network_image/cached_network_image.dart';
import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:commercial/features/products/presentation/widgets/product_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';
import '../../../../core/utils/text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.colorWhite, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.circular(15)),
            width: double.maxFinite,
            height: height(context) * 0.2,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15), bottom: Radius.circular(35)),
                    child: CachedNetworkImage(
                        imageUrl: products.image.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                               const  ProductCardLoading(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: height(context) * 0.25,
                        width: double.infinity,
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: height(context) * 0.02,
                    backgroundColor: AppColors.colorWhiteLight.withOpacity(0.8),
                    child: SvgPicture.asset(AppAssets.heartOff),
                  ),
                ),
                Positioned(
                  bottom: -25,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorWhiteLight,
                    radius: 25,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.colorBlack.withAlpha(120),
                                blurRadius: 10,
                                spreadRadius: 0.2),
                          ],
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          AppAssets.bag,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.02),
            child: Text(products.title.toString(),
                overflow: TextOverflow.ellipsis, style: Styles.style12mainClrS),
          ),
          const SizedBox(height: 5),
          Text('\$ ${products.price}', style: Styles.style14mainClrL),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
