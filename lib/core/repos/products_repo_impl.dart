import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/entities/product_entity.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/model/product_model.dart';
import 'package:fruit_app/core/repos/products_repo.dart';
import 'package:fruit_app/core/services/database_services.dart';
import 'package:fruit_app/core/utils/backend_endpoint.dart';

class ProductsRepoImpl extends ProductRepo {
  final DatabaseServices databaseServices;

  ProductsRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data =
          await databaseServices.getData(path: BackendEndpoint.getProducts,
          query: {
            'limit': '10',
            'orderBy': 'sellingCount',
            'descending': true,
          }
          )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromjson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data =
          await databaseServices.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromjson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('failed to get products'));
    }
  }
}
