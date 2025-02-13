import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_fading_widget.dart';
import 'product_card_loading.dart';

class ProductsGridLoading extends StatelessWidget {
  const ProductsGridLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 4,
          childAspectRatio: 1,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ProductCardLoading();
        },
      ),
    );
  }
}