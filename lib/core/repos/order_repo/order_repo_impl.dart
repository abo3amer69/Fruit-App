import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/repos/order_repo/orders_repo.dart';
import 'package:fruit_app/core/services/database_services.dart';
import 'package:fruit_app/core/services/firestore_services.dart';
import 'package:fruit_app/core/utils/backend_endpoint.dart';
import 'package:fruit_app/features/checkout/data/models/order_model.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseServices firestoreServices;

  OrderRepoImpl(this.firestoreServices);
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity order,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await firestoreServices.addData(
        path: BackendEndpoint.addOrder,
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
