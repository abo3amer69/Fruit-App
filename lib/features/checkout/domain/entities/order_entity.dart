import 'package:fruit_app/features/checkout/domain/entities/shipping_adress_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final bool? patWithCash;
  final ShippingAdressEntity? shippingAdressEntity;

  OrderEntity(this.cartEntity, {this.patWithCash, this.shippingAdressEntity});
}
