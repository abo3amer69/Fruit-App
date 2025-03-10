
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruit_app/features/auth/presentation/views/widget/signup_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return SignupViewBody();
      },
    );
  }
}