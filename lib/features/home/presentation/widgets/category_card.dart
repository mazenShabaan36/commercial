import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';
import '../../../../core/utils/text.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard(
      {super.key,
      required this.categories,
      required this.index,
      required this.isSelected});

  final List categories;
  final int index;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width(context) * 0.02,
        vertical: height(context) * 0.01,
      ),
      decoration: BoxDecoration(
          color:
              isSelected ? AppColors.colorWhiteLight : AppColors.colorGreyMed,
          borderRadius: BorderRadius.circular(26)),
      child: Text(
        categories[index],
        style: Styles.style12mainClrM,
      ),
    );
  }
}
