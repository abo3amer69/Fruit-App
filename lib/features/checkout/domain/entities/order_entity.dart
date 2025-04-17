import 'package:fruit_app/features/checkout/domain/entities/shipping_adress_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool patWithCash;
  final ShippingAdressEntity shippingAdressEntity;

  OrderEntity(this.cartItems, this.patWithCash, this.shippingAdressEntity);
}
