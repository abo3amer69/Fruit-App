import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/repos/products_repo.dart';

class ProductsRepoImpl extends ProductRepo{
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() {
    // TODO: implement getBestSellingProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}