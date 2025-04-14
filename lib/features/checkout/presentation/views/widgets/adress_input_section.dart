import 'package:flutter/material.dart';
import 'package:fruit_app/core/widget/custom_text_form_field.dart';

class AdressInputSection extends StatelessWidget {
  const AdressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'الاسم كامل',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.text,
          ),
           SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'العنوان',
            textInputType: TextInputType.text,
          ),
           SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'المدينه',
            textInputType: TextInputType.text,
          ),
           SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            textInputType: TextInputType.text,
          ),
           SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.number,
          ),
           SizedBox(height: 16),
        ],
      ),
    );
  }
}
