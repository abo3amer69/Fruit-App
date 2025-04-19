import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper_function/get_user.dart';
import 'package:fruit_app/core/widget/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/domain/entities/shipping_adress_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
      body: Provider.value(
        value: OrderEntity(
          uId: getUser().uid,
          cartEntity,
          shippingAdressEntity: ShippingAdressEntity(),
        ),
        child: CheckoutViewBody(),
      ),
    );
  }
}
