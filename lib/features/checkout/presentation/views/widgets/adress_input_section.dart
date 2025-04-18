import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/widget/custom_text_form_field.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

class AdressInputSection extends StatelessWidget {
  const AdressInputSection({super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final  ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder:
            (context, value, child) => Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAdressEntity!.name =
                          value!;
                    },
                    hintText: 'الاسم كامل',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAdressEntity!.email =
                          value!;
                    },
                    hintText: 'البريد الإلكتروني',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAdressEntity!.adress =
                          value!;
                    },
                    hintText: 'العنوان',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAdressEntity!.city =
                          value!;
                    },
                    hintText: 'المدينه',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAdressEntity!.floor =
                          value!;
                    },
                    hintText: 'رقم الطابق , رقم الشقه ..',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAdressEntity!.phone =
                          value!;
                    },
                    hintText: 'رقم الهاتف',
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
      ),
    );
  }
}
