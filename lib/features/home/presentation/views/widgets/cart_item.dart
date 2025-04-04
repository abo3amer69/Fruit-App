import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/custom_network_image.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdate) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: BoxDecoration(color: Color(0xffF3F5F7)),
                child: CustomNetworkImage(
                  imageurl: cartItemEntity.productEntity.imageUrl!,
                ),
              ),
              SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deletCartItem(
                              cartItemEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.assetsImagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()} كم',
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),

                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity),
                        Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
