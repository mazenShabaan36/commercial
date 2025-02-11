import 'package:commercial/core/utils/app_assets.dart';
import 'package:commercial/core/utils/app_colors.dart';
import 'package:commercial/core/utils/app_strings.dart';
import 'package:commercial/core/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/text.dart';

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  color: Colors.amber,
      width: width(context) * 1.0,
      height: height(context) * 0.073,
      child: Padding(
        padding: EdgeInsets.zero,
        child: TextFormField(
          cursorColor: AppColors.mainColor,
          //  textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.bottom,
          controller: textEditingController,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.colorGreyMed,
            hintText: AppStrings.whatAreYouLookingFor,
            hintStyle: Styles.style10greyM,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
              ), // Set border color here
            ),
            prefixIcon: InkWell(
              child: Transform.scale(
                scale: 0.5,
                child: SvgPicture.asset(
                  AppAssets.search,
                ),
              ),
            ),

            suffixIcon: textEditingController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.clear,
                      color: AppColors.mainColor,
                    ),
                  )
                : null,
            //    contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16), // Adjust this
            isDense: false,
          ),
          //
          style: Styles.style10greyM.copyWith(color: AppColors.mainColor),
        ),
      ),
    );
  }
}
