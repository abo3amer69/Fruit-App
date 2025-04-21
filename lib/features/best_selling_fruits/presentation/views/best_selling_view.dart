import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/custom_app_bar.dart';
import 'package:fruit_app/core/widget/notification_widget.dart';
import 'package:fruit_app/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'best-selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: ' الاكثر مبيعًا'),
      body: BestSellingViewBody(),
    );
  }
}
