import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/payment_item.dart';

class ShippingAdressWidget extends StatelessWidget {
  const ShippingAdressWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(Assets.assetsImagesLocation),
          const SizedBox(width: 8),
          Text(
            ' ${context.read<OrderEntity>().shippingAdressEntity}',
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(Assets.assetsImagesEdit),
                  const SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
