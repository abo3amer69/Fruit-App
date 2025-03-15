import 'package:flutter/material.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/widget/fruit_item.dart';
import 'package:fruit_app/core/widget/search_text_field.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPaddding),
                CustomHomeAppBar(),
                SizedBox(height: kTopPaddding),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 16),
                BestSellingHeader(),
                SizedBox(height: 8,),
              ],
            ),
          ),
        BestSellingGridView(),
        ],
      ),
    );
  }
}
