import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/custom_button.dart';
import 'package:fruit_app/core/widget/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/dont_have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/or_divider.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/social_login_button.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              suffixicon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
            SizedBox(height: 33),
            DontHaveAnAccountWidget(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 16,),
            SocialLoginButton(
              onPressed: () {},
              title: 'تسجيل الدخول بواسطة جوجل',
              image: Assets.assetsImagesGoogleIcon,
            ),
            SizedBox(height: 16,),
            SocialLoginButton(
              onPressed: () {},
              title: 'تسجيل الدخول بواسكة ابل',
              image: Assets.assetsImagesApplIcon,
            ),
            SizedBox(height: 16,),
            SocialLoginButton(
              onPressed: () {},
              title: 'تسجيل الدخول بواسطة فيسبوك',
              image: Assets.assetsImagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
