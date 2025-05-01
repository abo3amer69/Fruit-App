import 'package:fruit_app/features/checkout/domain/entities/shipping_adress_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class OrderInputEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? patWithCash;
  ShippingAdressEntity shippingAdressEntity;

  OrderInputEntity(
    this.cartEntity, {
    this.patWithCash,
    required this.shippingAdressEntity,
    required this.uId,
  });

  double calculateShippingCost() {
    if (patWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }

  
}
