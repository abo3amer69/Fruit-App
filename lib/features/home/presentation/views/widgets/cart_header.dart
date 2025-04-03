import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: Color(0xffEBF9F1)),
      child: Center(
        child: Text('لديك 3 منتجات في سله التسوق', style: TextStyles.regular13),
      ),
    );
  }
}
