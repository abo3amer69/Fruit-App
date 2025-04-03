  import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/notification_widget.dart';

AppBar buildAppBarr() {
    return AppBar(
      actions: [Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      )],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'الأكثر مبيعًا',
        textAlign: TextAlign.center,
        style: TextStyles.bold19,
      ),
    );
  }