import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size.dart';
import '../../../../core/utils/text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../bloc/bloc/cart_bloc.dart';

class CartErrorContent extends StatelessWidget {
  const CartErrorContent({super.key, required this.state});
  final CartError state;

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
                context.read<CartBloc>().add(GetCart());
              },
              backgroundColor: AppColors.mainColor,
              borderRadius: 45,
              padding: 8),
        ),
      ],
    );
  }
}
