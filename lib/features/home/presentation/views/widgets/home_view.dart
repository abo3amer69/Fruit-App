import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/cubits/product_cubit.dart/products_cubit.dart';
import 'package:fruit_app/core/repos/products_repo.dart';
import 'package:fruit_app/core/services/get_it_services.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepo>(),               
      ),
      child:const HomeViewBody(),
    );
  }
}
