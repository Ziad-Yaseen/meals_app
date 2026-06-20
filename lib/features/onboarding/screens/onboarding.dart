import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/resources/app_assets.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/services/onboarding_services.dart';
import 'package:meals_app/core/spacing/app_spacing.dart';
import 'package:meals_app/core/spacing/app_radius.dart';
import 'package:meals_app/features/onboarding/models/title_model.dart';
import 'package:meals_app/features/onboarding/widgets/slider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<String> titles = [];
  List<String> subtitles = [];
  List<Widget> models = [
    const TitleModel(
      title: 'Save Your Meals Ingredient',
      subtitle:
          'Add Your Meals and its Ingredients and we will save it for you',
    ),
    const TitleModel(
      title: 'Use Our App The Best Choice',
      subtitle: 'the best choice for your kitchen do not hesitate',
    ),
    const TitleModel(
      title: 'Our App Your Ultimate Choice',
      subtitle:
          'All the best restaurants and their top menus are ready for you',
    ),
  ];

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((callback) {
  //     bool isFirstTime = OnboardingServices.isFIrstTime();
  //     if (!isFirstTime) {
  //       GoRouter.of(context).pushReplacementNamed(AppRoutes.home);
  //       OnboardingServices.setFIrstTime();
  //     }
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.bgImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: AppHeights.h40,
            right: AppWidth.w32,
            left: AppWidth.w32,
            child: Container(
              height: AppHeights.h400,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(AppRadius.r48),
              ),
              child: CustomSlider(
                list: models,
                onSkip: () {
                  GoRouter.of(context).pushReplacementNamed(AppRoutes.home);
                  OnboardingServices.setFIrstTime();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
