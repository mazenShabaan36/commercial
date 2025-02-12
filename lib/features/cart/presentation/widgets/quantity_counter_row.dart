import 'package:commercial/core/utils/app_assets.dart';
import 'package:commercial/features/cart/presentation/bloc/bloc/cart_bloc.dart';
import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/size.dart';
import '../../../../core/utils/text.dart';

class QuantityCounterRow extends StatelessWidget {
  const QuantityCounterRow(
      {super.key, required this.index, required this.item});
  final int index;
  final Products item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  context.read<CartBloc>().add(IncreaseQuantity(index));
                },
                child: SvgPicture.asset(AppAssets.plusIcon)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(context) * 0.02),
              child: Text('${item.quantity}', style: Styles.style12mainClrL),
            ),
            GestureDetector(
                onTap: () {
                  context.read<CartBloc>().add(DecreaseQuantity(index));
                },
                child: SvgPicture.asset(AppAssets.minusingICon)),
          ],
        ),
        GestureDetector(
            onTap: () {
              context.read<CartBloc>().add(RemoveItem(index));
            },
            child: SvgPicture.asset(AppAssets.delete)),
      ],
    );
  }
}
