import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.increaseQuanitty();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(CartItemAdded());
  }

  void deletCartItem(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);

    emit(CartItemRemoved());
  }
}
