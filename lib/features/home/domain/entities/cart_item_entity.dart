import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  CartItemEntity({required this.productEntity, this.quanitty = 0});

  num calculateTotalPrice() {
    return productEntity.price * quanitty;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quanitty;
  }

  increaseQuanitty() {
    quanitty++;
  }

  decreaseQuanitty() {
    quanitty--;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
