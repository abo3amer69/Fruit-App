import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/custom_network_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: Color(0xffF3F5F7)),
            child: CustomNetworkImage(
              imageurl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyDcEEqaZC7Kq9Ib9_guDv0gJfPLt4NtmzEw&s',
            ),
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('بطيج', style: TextStyles.bold13),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.assetsImagesTrash),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
