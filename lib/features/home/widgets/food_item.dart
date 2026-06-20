import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/components/spacing.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/spacing/app_font_size.dart';
import 'package:meals_app/core/styles/app_styles.dart';
import 'package:meals_app/features/home/models/recipe_model.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.item});
  final RecipeModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.image),
          HeightSpace(8.h),
          Text(item.name, style: AppStyles.normal),
          HeightSpace(8.h),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.primary),
              Text(
                '${item.stars}',
                style: AppStyles.normal.copyWith(fontSize: AppFontSize.sp12),
              ),
              const Spacer(),
              const Icon(Icons.watch_later, color: AppColors.primary),
              Text(
                '${item.minimumTime} - ${item.maximumTime}',
                style: AppStyles.normal.copyWith(fontSize: AppFontSize.sp12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
