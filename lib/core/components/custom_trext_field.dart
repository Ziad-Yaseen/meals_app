import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/spacing/app_font_size.dart';
import 'package:meals_app/core/styles/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.showPasswordIcon = false,
    this.height,
    this.width,
    // this.hint = 'Hint',
    // this.fillColor = AppColors.txtFieldFillColor,
    this.strokeColor = AppColors.gray,
    this.cursorColor = AppColors.primary,
    this.icon = Icons.remove_red_eye_outlined,
    this.borderRadius = 8,
    this.onPressed,
    this.password = false,
    this.controller,
    this.validator,
    this.onChange
  });
  final bool showPasswordIcon;
  final double? height;
  final double? width;
  // final String hint;
  // final Color fillColor;
  final Color strokeColor;
  final Color cursorColor;
  final IconData icon;
  final double borderRadius;
  final VoidCallback? onPressed;
  final bool password;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        onChanged: (value) {
          onChange;
        },
        controller: controller,
        validator: validator,
        obscureText: password,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autofocus: false,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          // hintText: hint,
          // hintStyle: AppStyles.textFieldStyle,
          contentPadding: const EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: BorderSide(color: strokeColor, width: 1),
          ),
          // filled: true,
          // fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: BorderSide(
              color: AppColors.primary.withValues(alpha: 0.6),
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
          ),
          suffixIcon: showPasswordIcon
              ? IconButton(
                  icon: Icon(
                    password ? icon : Icons.visibility_off_outlined,
                    size: 24.sp,
                    color: AppColors.grey,
                  ),
                  onPressed: onPressed,
                )
              : null,
        ),
        style: AppStyles.normal.copyWith(
          fontSize: AppFontSize.sp14
        ),
      ),
    );
  }
}