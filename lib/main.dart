import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_function/on_generate_routes.dart';
import 'package:fruit_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHup());
}
class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}