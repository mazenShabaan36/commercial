import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text.dart';
import '../../data/models/products/products.dart';

class SubtotalColumn extends StatelessWidget {
  const SubtotalColumn({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.subtotal,
          style: Styles.style12greyM,
        ),
        Text(
          "\$${products.price}",
          style: Styles.style24mainClrL,
        ),
      ],
    );
  }
}
