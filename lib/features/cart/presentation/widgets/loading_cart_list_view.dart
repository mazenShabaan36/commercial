import 'package:commercial/features/cart/presentation/widgets/cart_item_card_loading.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_fading_widget.dart';

class LoadingCartListView extends StatelessWidget {
  const LoadingCartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return const CartItemCardLoading();
        },
      ),
    );
  }
}