import 'package:commercial/core/utils/app_assets.dart';
import 'package:commercial/core/utils/app_colors.dart';
import 'package:commercial/core/utils/app_strings.dart';
import 'package:commercial/core/utils/size.dart';
import 'package:commercial/core/widgets/custom_button.dart';
import 'package:commercial/features/products/presentation/widgets/page_indicators_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/text.dart';
import '../../data/models/products/products.dart';
import '../widgets/subtotal_column.dart';
import '../widgets/top_icons_row.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.82,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.colorBlack.withAlpha(120),
                      blurRadius: 120,
                      spreadRadius: 0.7),
                ],
                image: DecorationImage(
                  image: NetworkImage(products.image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const TopIconsRow(),
                  const Spacer(),
                  Column(
                    children: [
                      SvgPicture.asset(AppAssets.swipIcon),
                      Text(
                        AppStrings.swipeUpForDetails,
                        style: Styles.style14whiteM,
                      ),
                      const SizedBox(height: 10),
                      const PageIndicatorsDots(),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width(context) * 0.04,
                  vertical: height(context) * 0.01),
              decoration: const BoxDecoration(
                color: AppColors.whiteBackground,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubtotalColumn(products: products),
                  SizedBox(
                    width: width(context) * 0.42,
                    child: CustomButton(
                        text: AppStrings.continueText,
                        onPressed: () {},
                        backgroundColor: AppColors.mainColor,
                        borderRadius: 30,
                        padding: 15),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
