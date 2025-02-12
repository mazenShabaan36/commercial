import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';

class ProductCardLoading extends StatelessWidget {
  const ProductCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.colorGreydark, borderRadius: BorderRadius.circular(15)),
      child:   SizedBox(
        width: double.infinity,
        height: height(context) * 0.5,
      ),
    );
  }
}