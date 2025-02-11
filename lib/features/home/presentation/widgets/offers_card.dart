import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/size.dart';
import '../../../../core/utils/text.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.colorGreyLight,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.shopWithUs, style: Styles.style14mainClrM),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: height(context) * 0.02),
                  child:
                      Text(AppStrings.get40Off, style: Styles.style20mainClrL),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.shopNow,
                      style: Styles.style12mainClrL,
                    ),
                    SvgPicture.asset(AppAssets.arrow)
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Image.asset(
            AppAssets.manphoto,
            height: height(context) * 0.2,
            width: width(context) * 0.3,
          ),
        ],
      ),
    );
  }
}
