import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/services/shared_preferences_singelton.dart';

import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/widget/custom_button.dart';
import 'package:fruit_app/features/auth/presentation/views/signin_view.dart';

import 'package:fruit_app/features/on_boarding/presentation/views/widget/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color:
                currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 29),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: CustomButton(
              onPressed: () {
                prefs.setBool(kIsOnBoardingViewSeen, true);
                Navigator.of(context).popAndPushNamed(SigninView.routeName,);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
