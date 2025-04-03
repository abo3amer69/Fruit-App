import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/cubits/product_cubit.dart/products_cubit.dart';
import 'package:fruit_app/core/widget/build_app_bar.dart';
import 'package:fruit_app/core/widget/custom_app_bar.dart';
import 'package:fruit_app/core/widget/search_text_field.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPaddding),
                buildAppBar(context, title: 'المنتجات', showBackButton: false),
                SizedBox(height: kTopPaddding),
                SearchTextField(),

                SizedBox(height: 16),
                ProductsViewHeader(
                  productLength: context.read<ProductsCubit>().productLength,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ProductGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
