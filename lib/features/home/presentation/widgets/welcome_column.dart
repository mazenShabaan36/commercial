import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text.dart';

class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcome,
          style: Styles.style10greyM,
        ),
        const SizedBox(height: 4),
        Text(
          AppStrings.falconThoghts,
          style: Styles.style12mainClrL,
        ),
      ],
    );
  }
}
