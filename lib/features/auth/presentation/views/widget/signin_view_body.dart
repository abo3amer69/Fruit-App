import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/core/utils/app_images.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/custom_button.dart';
import 'package:fruit_app/core/widget/custom_text_form_field.dart';
import 'package:fruit_app/core/widget/password_field.dart';
import 'package:fruit_app/features/auth/presentation/cubits/signin_scubit/signin_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/dont_have_an_account_widget.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/or_divider.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل الدخول',
              ),
              SizedBox(height: 33),
              DontHaveAnAccountWidget(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signinWithGoogle();
                },
                title: 'تسجيل الدخول بواسطة جوجل',
                image: Assets.assetsImagesGoogleIcon,
              ),
              SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                title: 'تسجيل الدخول بواسكة ابل',
                image: Assets.assetsImagesApplIcon,
              ),
              SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                title: 'تسجيل الدخول بواسطة فيسبوك',
                image: Assets.assetsImagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
