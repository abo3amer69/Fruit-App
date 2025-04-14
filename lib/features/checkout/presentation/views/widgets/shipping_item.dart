import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.supTitle,
    required this.price,
  });

  final String title, supTitle, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 13, right: 28, bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: Color(0xffD9D9D9)),
                ),
              ),
            ),
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
