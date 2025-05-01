import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});
}
