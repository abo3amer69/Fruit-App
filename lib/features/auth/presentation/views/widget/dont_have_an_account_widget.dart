
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تملك حساب؟',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
    
          TextSpan(
            text: '   ',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff616A6B),
            ),
          ),
    
          TextSpan(
            text: 'قم بانشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}