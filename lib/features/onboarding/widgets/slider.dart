import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/components/spacing.dart';
import 'package:meals_app/core/constants/app_colors.dart';
import 'package:meals_app/core/resources/app_icons.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/spacing/app_font_size.dart';
import 'package:meals_app/core/spacing/app_radius.dart';
import 'package:meals_app/core/spacing/app_spacing.dart';
import 'package:meals_app/core/styles/app_styles.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.list});
  final List<Widget> list;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _currentIndex = 0;
  CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              _currentIndex = index;
              setState(() {});
            },
            viewportFraction: 1,
            height: AppHeights.h220,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
          ),
          items: widget.list.map((widgetItem) {
            return Builder(
              builder: (BuildContext context) {
                return widgetItem;
              },
            );
          }).toList(),
        ),
        HeightSpace(AppHeights.h16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.list.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w4 / 2),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppRadius.r48),
                onTap: () {
                  controller.animateToPage(index);
                  _currentIndex = index;
                  setState(() {});
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: AppWidth.w24,
                  height: AppHeights.h6,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Colors.white
                        : AppColors.darkGray,
                    borderRadius: BorderRadius.circular(AppRadius.r48),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        _currentIndex == 2
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).pushReplacementNamed(AppRoutes.home);
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    padding: const EdgeInsets.all(19),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Icon(
                      AppIcons.arrow,
                      color: AppColors.primary,
                      size: AppFontSize.sp24,
                    ),
                  ),
                ),
              )
            : Row(
                children: [
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).pushReplacementNamed(AppRoutes.home);
                    },
                    child: Text('Skip', style: AppStyles.witeText),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      _currentIndex++;
                      controller.animateToPage(_currentIndex);
                      setState(() {});
                    },
                    child: Text('Next', style: AppStyles.witeText),
                  ),
                ],
              ),
      ],
    );
  }
}
