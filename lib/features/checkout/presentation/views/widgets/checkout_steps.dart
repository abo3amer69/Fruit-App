import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/in_active_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(child: InActiveStepItem(
          index: index.toString(),
          text: getSteps()[index]));
      }),
    );
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'الدفع', 'المراجعة'];
  }
}
