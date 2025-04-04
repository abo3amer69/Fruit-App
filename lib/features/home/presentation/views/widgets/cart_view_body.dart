import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/widget/custom_app_bar.dart';
import 'package:fruit_app/core/widget/custom_button.dart';
import 'package:fruit_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/cart_item.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPaddding),
                  buildAppBar(
                    context,
                    title: 'سلة التسوق',
                    showNotification: false,
                  ),
                  SizedBox(height: 16),
                  CartHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cartItems.isEmpty
                      ? SizedBox()
                      : CustomDivider(),
            ),

            CartItemList(
              cartItems: context.read<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntity.cartItems.isEmpty
                      ? SizedBox()
                      : CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: CustomButton(
            onPressed: () {},
            text:
                'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه ',
          ),
        ),
      ],
    );
  }
}
