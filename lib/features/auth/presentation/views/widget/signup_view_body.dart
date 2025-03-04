import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/widget/custom_button.dart';
import 'package:fruit_app/core/widget/custom_text_form_field.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/have_an_account.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              suffixicon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 16),
            TermsAndConditionsWidget(onChanged: (value) {}),
            SizedBox(height: 30,),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            SizedBox(height: 26,),
            HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
