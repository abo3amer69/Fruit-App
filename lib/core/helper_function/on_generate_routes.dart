import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/presentation/views/signin_view.dart';
import 'package:fruit_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruit_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_app/features/home/presentation/views/main_view.dart';
import 'package:fruit_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_app/features/splash/presentation/views/splash_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());

    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
