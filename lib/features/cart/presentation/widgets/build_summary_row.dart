import 'package:flutter/widgets.dart';

import '../../../../core/utils/text.dart';

class BuildSummaryRow extends StatelessWidget {
  const BuildSummaryRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.style14greyM),
          Flexible(child: Text(value, style: Styles.style16mainClrL)),
        ],
      ),
    );
  }
}
