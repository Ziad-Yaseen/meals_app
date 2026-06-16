import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.txt,
    required this.onPressed,
    this.color = AppColors.primary,
    this.width = 331,
    this.height = 56,
    this.borderRadius = 8,
    this.textColor = AppColors.white,
    this.fontSize = 15,
    super.key,
  });
  final String txt;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback onPressed;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(borderRadius.r),
        ),
        fixedSize: Size(width.w, height.h),
      ),
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}