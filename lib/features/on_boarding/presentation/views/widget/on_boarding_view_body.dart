import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/features/on_boarding/presentation/views/widget/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
