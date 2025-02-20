import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/custom_app_bar.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول'),
      body: LoginViewBody(),
    );
  }

}
