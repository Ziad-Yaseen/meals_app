import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => GoRouter.of(context).pop(),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}
