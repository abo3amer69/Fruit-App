import 'package:bloc/bloc.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/repos/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo;
  int productLength = 0;

  Future<void> getProduct() async {
    emit(ProductsLoading());

    final result = await productRepo.getProduct();

    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }

  Future<void> getBestSellingProduct() async {
    emit(ProductsLoading());

    final result = await productRepo.getBestSellingProduct();

    result.fold((failure) => emit(ProductsFailure(failure.message)), (
      products,
    ) {
      productLength = products.length;
      emit(ProductsSuccess(products));
    });
  }
}
