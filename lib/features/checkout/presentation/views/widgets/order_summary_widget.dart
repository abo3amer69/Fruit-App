import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30} جنية',
                style: TextStyles.regular13.copyWith(color: Color(0xff4E5556)),
              ),
            ],
          ),
          SizedBox(height: 9),
          Divider(thickness: .5, color: Color(0xffCACECE)),
          SizedBox(height: 9),
          Row(
            children: [
              Text('الكلي', style: TextStyles.bold16),
              Spacer(),
              Text('180 جنيه', style: TextStyles.bold16),
            ],
          ),
        ],
      ),
    );
  }
}
