import 'package:flutter/material.dart';
import 'package:fruit_app/core/widget/custom_button.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomButton(
            onPressed: () {
              pageController.animateToPage(2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
              );
            },
            text: 'التالي',
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
