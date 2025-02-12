import 'package:commercial/core/routers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_assets.dart';
import 'welcome_column.dart';

class WelcomingRow extends StatelessWidget {
  const WelcomingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const WelcomeColumn(),
        GestureDetector(
            onTap: () {
              context.go(AppRoutes.cart);
            },
            child: SvgPicture.asset(AppAssets.bag)),
      ],
    );
  }
}
