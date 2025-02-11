import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routers/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/size.dart';
import 'circle_icon.dart';

class TopIconsRow extends StatelessWidget {
  const TopIconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: height(context) * 0.08,
          left: width(context) * 0.04,
          right: width(context) * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.go(AppRoutes.home);
            },
            child: SvgPicture.asset(
              AppAssets.arrowBackIcon,
              height: height(context) * 0.04,
            ),
          ),
          const Row(
            children: [
              CircleIcon(
                iconurl: AppAssets.heartOff,
              ),
              SizedBox(width: 10),
              CircleIcon(
                iconurl: AppAssets.bag,
              ),
            ],
          ),
        ],
      ),
    );
  }
}