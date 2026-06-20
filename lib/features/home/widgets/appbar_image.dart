import 'package:flutter/material.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/resources/app_assets.dart';
import 'package:meals_app/core/styles/app_styles.dart';

class AppbarImage extends StatelessWidget {
  const AppbarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AppAssets.appbarImage),
        Positioned(
          left: 43,
          // bottom: 0,
          // top: 0,
          child: SizedBox(
            width: 240,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(48),
              ),
              child: Text(
                'Welcome Add A New Recipe',
                style: AppStyles.onBoardingTitle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
