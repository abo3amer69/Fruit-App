import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/adress_input_section.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AdressInputSection(formKey: formKey, valueListenable: valueListenable),
      PaymentSection(pageController: pageController),
    ];
  }
}
