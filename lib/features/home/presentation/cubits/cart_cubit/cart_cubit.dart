import 'package:bloc/bloc.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity= CartEntity([]);
  void addCaerItem(CartItemEntity cartItemEntity) {
    cartEntity.addCartItem(cartItemEntity);
    emit(CartItemAdded());
  }
}
