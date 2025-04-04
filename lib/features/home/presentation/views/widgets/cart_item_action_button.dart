import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});


  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          iconColor: Colors.white,
          icon: Icons.add,
          color: AppColors.primaryColor,
          onpressed: () {
            cartItemEntity.increaseCount()
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.count.toString(),
            textAlign: TextAlign.right,
            style: TextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          iconColor: Colors.grey,
          icon: Icons.remove,
          color: Color(0xffF3F5F7),
          onpressed: () {
            cartItemEntity.decreaseCount();
          },
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onpressed,
    required this.iconColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
