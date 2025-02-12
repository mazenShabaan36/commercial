import 'package:commercial/core/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class Styles {
  static final TextStyle style10greyM = GoogleFonts.poppins(
      fontSize: AppFonts.t10,
      fontWeight: FontWeight.w400,
      color: AppColors.colorGreyText);

  static final TextStyle style12greyM = GoogleFonts.poppins(
      fontSize: AppFonts.t12,
      fontWeight: FontWeight.w400,
      color: AppColors.colorGreyText);
  static final TextStyle style14greyM = GoogleFonts.poppins(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w400,
      color: AppColors.colorGreyText);
  static final TextStyle style14greyL = GoogleFonts.poppins(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w600,
      color: AppColors.colorGreyText);
  static final TextStyle style12mainClrL = GoogleFonts.poppins(
      fontSize: AppFonts.t12,
      fontWeight: FontWeight.w600,
      color: AppColors.mainColor);
  static final TextStyle style12mainClrM = GoogleFonts.poppins(
      fontSize: AppFonts.t12,
      fontWeight: FontWeight.w500,
      color: AppColors.mainColor);
  static final TextStyle style12mainClrS = GoogleFonts.poppins(
      fontSize: AppFonts.t12,
      fontWeight: FontWeight.w400,
      color: AppColors.mainColor);
  static final TextStyle style14mainClrM = GoogleFonts.poppins(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w400,
      color: AppColors.mainColor);
  static final TextStyle style14mainClrL = GoogleFonts.poppins(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w600,
      color: AppColors.mainColor);
  static final TextStyle style16mainClrL = GoogleFonts.poppins(
      fontSize: AppFonts.t16,
      fontWeight: FontWeight.w600,
      color: AppColors.mainColor);
  static final TextStyle style20mainClrL = GoogleFonts.poppins(
      fontSize: AppFonts.t20,
      fontWeight: FontWeight.w700,
      color: AppColors.mainColor);
  static final TextStyle style24mainClrL = GoogleFonts.poppins(
      fontSize: AppFonts.h24,
      fontWeight: FontWeight.w500,
      color: AppColors.mainColor);
  static final TextStyle style14whiteM = GoogleFonts.poppins(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w400,
      color: AppColors.colorWhiteLight);
  static final TextStyle style14whiteL = GoogleFonts.poppins(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w600,
      color: AppColors.colorWhite);
}
