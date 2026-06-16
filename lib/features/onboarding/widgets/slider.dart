import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/components/spacing.dart';
import 'package:meals_app/core/constants/app_colors.dart';
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
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Text('Skip', style: AppStyles.witeText),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Text('Next', style: AppStyles.witeText),
            ),
          ],
        ),
      ],
    );
  }
}
