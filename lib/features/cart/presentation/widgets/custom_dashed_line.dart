import 'package:commercial/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          30,
          (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    height: 2,
                    color: AppColors.dashedColorLine,
                  ),
                ),
              )),
    );
  }
}
