import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper_function/get_user.dart';
import 'package:fruit_app/core/repos/order_repo/orders_repo.dart';
import 'package:fruit_app/core/services/get_it_services.dart';
import 'package:fruit_app/core/widget/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/domain/entities/shipping_adress_entity.dart';
import 'package:fruit_app/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    orderEntity = OrderInputEntity(
      uId: getUser().uid,
      widget.cartEntity,
      shippingAdressEntity: ShippingAdressEntity(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
        body: Provider.value(
          value: orderEntity,
          child: AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
