
  import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';
import 'package:fruit_app/core/widget/notification_widget.dart';

AppBar buildAppBar(context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      )],
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
      centerTitle: true,
      title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
    );
  }