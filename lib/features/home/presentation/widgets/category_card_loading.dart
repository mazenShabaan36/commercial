

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';

class CategoryCardLoading extends StatelessWidget {
  const CategoryCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width(context) * 0.02,
        vertical: height(context) * 0.01,
      ),
      decoration: BoxDecoration(
          color: AppColors.colorGreydark,
          borderRadius: BorderRadius.circular(26)),
      child:  SizedBox(
        width: width(context) * 0.2,
        height: height(context) * 0.04,
      ),
    );
  }
}
