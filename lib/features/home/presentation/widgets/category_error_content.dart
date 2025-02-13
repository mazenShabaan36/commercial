import 'package:commercial/features/home/presentation/bloc/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';
import '../../../../core/utils/text.dart';
import '../../../../core/widgets/custom_button.dart';

class CategoryErrorContent extends StatelessWidget {
  const CategoryErrorContent({super.key, required this.state});
  final CategoryError state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(state.message,
            style: Styles.style20mainClrL.copyWith(color: AppColors.red)),
        const SizedBox(height: 10),
        SizedBox(
          width: width(context) * 0.5,
          child: CustomButton(
              text: 'Retry',
              onPressed: () {
                context.read<CategoryBloc>().add(FetchCategories());
              },
              backgroundColor: AppColors.mainColor,
              borderRadius: 45,
              padding: 8),
        ),
      ],
    );
  }
}
