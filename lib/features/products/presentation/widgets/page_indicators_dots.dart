import 'package:flutter/material.dart';

class PageIndicatorsDots extends StatelessWidget {
  const PageIndicatorsDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == 1 ? 10 : 6, // Highlight middle dot
          height: index == 1 ? 10 : 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 1 ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
