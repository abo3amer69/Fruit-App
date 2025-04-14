import 'package:flutter/widgets.dart';

abstract class AppDecoration {
  static var greyBoxDecoration = ShapeDecoration(
    color: Color(0x7FF2F3F3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
