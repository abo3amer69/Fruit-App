import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.supTitle,
    required this.price,
    required this.isSelected,
  });

  final String title, supTitle, price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(top: 16, left: 13, right: 28, bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.semiBold13),
                SizedBox(height: 6),
                Text(
                  supTitle,
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13.copyWith(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                price,
                style: TextStyles.bold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
    
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xff949D9E))),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: Color(0xff1B5E37),
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
