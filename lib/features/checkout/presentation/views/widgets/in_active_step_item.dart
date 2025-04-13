import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xffF2F3F3),
          child: Text('2', style: TextStyles.semiBold13),
        ),
        SizedBox(width: 4),
        Text(
          'الشحن',
          style: TextStyles.semiBold13.copyWith(color: Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}
