import 'package:flutter/material.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          onTap: () {
            selectedIndex = 0;
            setState(() {});
            orderEntity.patWithCash = true;
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          supTitle: 'التسليم من المكان',
          price:
              (context.read<OrderEntity>().cartEntity.calculateTotalPrice() +
                      30)
                  .toString(),
        ),
        SizedBox(height: 16),
        ShippingItem(
          onTap: () {
            selectedIndex = 1;
            setState(() {});
            orderEntity.patWithCash = false;
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          supTitle: 'يرجي تحديد طريقه الدفع',
          price:
              context
                  .read<OrderEntity>()
                  .cartEntity
                  .calculateTotalPrice()
                  .toString(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
