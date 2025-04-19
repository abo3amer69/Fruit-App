import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_app/core/repos/order_repo/orders_repo.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());

  final OrderRepo ordersRepo;

  Future<void> addOrder({required OrderEntity order}) async {
    emit(AddOrderLoading());

    final result = await ordersRepo.addOrder(order: order);

    result.fold(
      (failure) => emit(AddOrderFailure( failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
