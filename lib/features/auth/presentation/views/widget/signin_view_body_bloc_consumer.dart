import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_app/core/widget/custom_progress_hud.dart';
import 'package:fruit_app/features/auth/presentation/cubits/signin_scubit/signin_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/signin_view_body.dart';
import 'package:fruit_app/features/home/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SigninFailure) {
          showBar(context, (state as SigninFailure).message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,

          child: const SigninViewBody(),
        );
      },
    );
  }
}


