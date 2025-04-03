import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);
  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
}