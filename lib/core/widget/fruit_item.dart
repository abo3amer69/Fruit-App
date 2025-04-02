import 'package:flutter/material.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xffF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(Assets.assetsImagesWatermelonTest),
                SizedBox(height: 24,),
                ListTile(
                  title: Text(
                    'بطيخ',
                    textAlign: TextAlign.center,
                    style: TextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20جنية',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '  ',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'كيلو',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
