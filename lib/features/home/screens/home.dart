import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/components/spacing.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/resources/app_assets.dart';
import 'package:meals_app/core/spacing/app_font_size.dart';
import 'package:meals_app/core/styles/app_styles.dart';
import 'package:meals_app/features/home/models/recipe_model.dart';
import 'package:meals_app/features/home/widgets/appbar_image.dart';
import 'package:meals_app/features/home/widgets/food_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> items = [
      RecipeModel(
        name: 'Cheese Burger',
        stars: 4.9,
        minimumTime: 20,
        maximumTime: 30,
        image: AppAssets.meal1,
      ),
      RecipeModel(
        name: 'Pasta',
        stars: 4.9,
        minimumTime: 20,
        maximumTime: 30,
        image: AppAssets.meal2,
      ),
      RecipeModel(
        name: 'Breakfast',
        stars: 4.9,
        minimumTime: 20,
        maximumTime: 30,
        image: AppAssets.meal3,
      ),
      RecipeModel(
        name: 'Fries',
        stars: 4.9,
        minimumTime: 20,
        maximumTime: 30,
        image: AppAssets.meal4,
      ),
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppbarImage(),
          HeightSpace(25.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Your Food',
              style: AppStyles.normal.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 15.w,
                mainAxisExtent: 200.h,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return FoodItem(item: items[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(
          side: BorderSide(color: AppColors.primary, width: 2),
        ),
        backgroundColor: Colors.transparent,
        // hoverColor: AppColors.primary.withValues(alpha: 0.2),
        splashColor: AppColors.primary.withValues(alpha: 0.05),
        elevation: 0,
        highlightElevation: 0,
        child: Icon(
          Icons.add,
          size: AppFontSize.sp24,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
