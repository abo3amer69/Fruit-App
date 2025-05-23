import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productLength});

  final int productLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productLength نتائج',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.10000000149011612),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.assetsImagesFilter2),
        ),
      ],
    );
  }
}
