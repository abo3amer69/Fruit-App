import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/active_step_item.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ActiveStepItem(),
    ],);
  }
}