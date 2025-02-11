import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        SvgPicture.asset(AppAssets.bag),
      ],
    );
  }
}
