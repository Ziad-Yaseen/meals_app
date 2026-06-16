import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/spacing/app_font_size.dart';

class AppStyles {
  static TextStyle onBoardingTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: AppFontSize.sp32,
    color:  AppColors.white,
  );

  static TextStyle witeText = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: AppFontSize.sp14,
    color:  AppColors.white,
  );

  static TextStyle inter14semibold = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: AppFontSize.sp14,
    color:  AppColors.white,
  );

  static TextStyle normal = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: AppFontSize.sp16,
    color:  AppColors.black,
  );

  static TextStyle greyText = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: AppFontSize.sp14,
    color:  AppColors.grey,
  );
}