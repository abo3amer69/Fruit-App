import 'package:fruit_app/features/checkout/data/models/order_product_model.dart';
import 'package:fruit_app/features/checkout/data/models/shipping_adress_model.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAdressModel shippingAdressModel;
  final List<OrderProductModel> orderProduct;
  final String paymentMethod;
  final String orderId;


  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.shippingAdressModel,
    required this.orderProduct,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      orderId: const Uuid().v4(),
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uId: orderEntity.uId,
      shippingAdressModel: ShippingAdressModel.fromEntity(
        orderEntity.shippingAdressEntity,
      ),
      orderProduct:
          orderEntity.cartEntity.cartItems
              .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
              .toList(),
      paymentMethod: orderEntity.patWithCash! ? 'Cash' : 'Paypal',
    );
  }

  toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAdressModel': shippingAdressModel.toJson(),
      'orderProduct': orderProduct.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
