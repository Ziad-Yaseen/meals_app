import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/components/spacing.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/spacing/app_font_size.dart';
import 'package:meals_app/core/styles/app_styles.dart';
import 'package:meals_app/features/home/data/db/db_helper.dart';
import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:meals_app/features/home/widgets/appbar_image.dart';
import 'package:meals_app/features/home/widgets/food_item.dart';

DBHelper dbHelper = DBHelper.instance;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: FutureBuilder(
              future: dbHelper.getMeals(),
              builder: (context, snapshot) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'No Meals Found',
                      style: AppStyles.onBoardingTitle.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: 15.w,
                      mainAxisExtent: 200.h,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Meal meal = snapshot.data![index];
                      return FoodItem(item: meal);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
                return Center(
                  child: Text(
                    'No Data Found',
                    style: AppStyles.onBoardingTitle.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                );
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
