import 'package:flutter/material.dart';

import '../../../../core/utils/size.dart';
import '../../../../core/widgets/custom_fading_widget.dart';
import 'category_card_loading.dart';

class CategoryListLoading extends StatelessWidget {
  const CategoryListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: height(context) * 0.04,
        child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 10),
                child: CategoryCardLoading(),
              );
            }),
      ),
    );
  }
}
