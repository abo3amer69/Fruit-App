import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          isSelected: true,
          title: 'الدفع عند الاستلام',
          supTitle: 'التسليم من المكان',
          price: '40',
        ),
        SizedBox(height: 16),
        ShippingItem(
          isSelected: false,
          title: 'الدفع اونلاين',
          supTitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
        ),
      ],
    );
  }
}
