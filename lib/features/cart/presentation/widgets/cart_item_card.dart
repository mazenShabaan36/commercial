import 'package:cached_network_image/cached_network_image.dart';
import 'package:commercial/features/products/data/models/products/products.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/size.dart';
import '../../../../core/utils/text.dart';
import 'quantity_counter_row.dart';
import 'title_size_row.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item, required this.index});
  final Products item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: item.image.toString(),
                height: height(context) * 0.1,
                width: width(context) * 0.22,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleSizeRow(
                    item: item,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: height(context) * 0.005),
                    child:
                        Text("\$${item.price}", style: Styles.style14mainClrL),
                  ),
                  QuantityCounterRow(
                    index: index,
                    item: item,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
