import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_app/core/helper_function/on_generate_routes.dart';
import 'package:fruit_app/core/services/custom_bloc_observer.dart';
import 'package:fruit_app/core/services/get_it_services.dart';
import 'package:fruit_app/core/services/shared_preferences_singelton.dart';
import 'package:fruit_app/core/utils/app_colors.dart';
import 'package:fruit_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_app/firebase_options.dart';

import 'generated/l10n.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await prefs.init();
  setupGetit();
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
