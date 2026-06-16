import 'package:flutter/material.dart';
import 'package:meals_app/core/components/spacing.dart';
import 'package:meals_app/core/spacing/app_spacing.dart';
import 'package:meals_app/core/styles/app_styles.dart';

class TitleModel extends StatelessWidget {
  const TitleModel({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.onBoardingTitle,
        ),
        HeightSpace(AppHeights.h16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppStyles.witeText,
        ),
      ],
    );
  }
}
