import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_buttom_navigation_bar.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtomNavigationBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}
