import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';

class CartItemCardLoading extends StatelessWidget {
  const CartItemCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: AppColors.colorGreydark,
          height: height(context) * 0.2,
          width: width(context),
        ),
      ),
    );
  }
}
