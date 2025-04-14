import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24,),
        OrderSummaryWidget(),
      ],
    );
  }
}
