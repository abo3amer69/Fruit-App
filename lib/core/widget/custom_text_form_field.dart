import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
     this.suffixicon,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        hintText: hintText,
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: Color(0xffE6E9E9)),
    );
  }
}
