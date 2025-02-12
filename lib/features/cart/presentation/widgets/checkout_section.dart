import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../bloc/bloc/cart_bloc.dart';
import 'build_summary_row.dart';
import 'custom_dashed_line.dart';

class CheckOutSection extends StatelessWidget {
  const CheckOutSection({super.key, required this.state});
  final CartLoaded state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          BuildSummaryRow(
            title: AppStrings.subtotal,
            value: "\$${state.subTotal.toStringAsFixed(2)}",
          ),
          BuildSummaryRow(
              title: AppStrings.shipping,
              value: "\$${state.shipping.toStringAsFixed(2)}"),
          const CustomDashedLine(),
          BuildSummaryRow(
            title: AppStrings.total,
            value: "\$${state.total.toStringAsFixed(2)}",
          ),
          const SizedBox(height: 16),
          CustomButton(
              text: AppStrings.checkOut,
              onPressed: () {},
              backgroundColor: AppColors.mainColor,
              borderRadius: 40,
              padding: 18),
        ],
      ),
    );
  }
}