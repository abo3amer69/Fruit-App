import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_app/core/helper_function/build_error_bar.dart';
import 'package:fruit_app/core/utils/app_keys.dart';
import 'package:fruit_app/core/widget/custom_button.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_app/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionVailadition(context);
              } else if (currentPageIndex == 1) {
                _handleAdressVailadition();
              } else {
                _processPayment(context);
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShippingSectionVailadition(BuildContext context) {
    if (context.read<OrderEntity>().patWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      showBar(context, 'يرجى اختيار طريقة الدفع');
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';

      case 1:
        return 'التالي';

      case 2:
        return 'الدفع عبر PayPal';

      default:
        return 'التالي';
    }
  }

  void _handleAdressVailadition() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,

        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: KpaypalClientId,
              secretKey: KpaypalSecertKey,
              transactions: [paypalPaymentEntity.toJson()],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                Navigator.pop(context);
                showBar(context, 'تم اضافة الطلب بنجاح');
              },
              onError: (error) {
                log(error.toString());
                showBar(context, 'حدث خطأ في الدفع الالكتروني');
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
      ),
    );
  }
}
