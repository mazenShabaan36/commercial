import 'package:flutter/widgets.dart';

import '../../../../core/utils/text.dart';
import '../../../products/data/models/products/products.dart';

class TitleSizeRow extends StatelessWidget {
  const TitleSizeRow({super.key, required this.item});
  final Products item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(item.title.toString(),
              overflow: TextOverflow.ellipsis, style: Styles.style12mainClrS),
        ),
        const SizedBox(
          width: 35,
        ),
        Text("L", style: Styles.style14greyL),
      ],
    );
  }
}
