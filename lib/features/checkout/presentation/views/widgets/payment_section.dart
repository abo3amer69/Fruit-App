import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/shipping_adress_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        OrderSummaryWidget(),
        SizedBox(height: 16),
        ShippingAdressWidget(pageController: pageController),
      ],
    );
  }
}
