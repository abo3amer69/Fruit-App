import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/widget/custom_app_bar.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
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
                CartItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
