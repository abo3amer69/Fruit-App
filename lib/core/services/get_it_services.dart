import 'package:fruit_app/core/repos/order_repo/order_repo_impl.dart';
import 'package:fruit_app/core/repos/order_repo/orders_repo.dart';
import 'package:fruit_app/core/repos/products_repo.dart';
import 'package:fruit_app/core/repos/products_repo_impl.dart';
import 'package:fruit_app/core/services/database_services.dart';
import 'package:fruit_app/core/services/firebase_auth_services.dart';
import 'package:fruit_app/core/services/firestore_services.dart';
import 'package:fruit_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductsRepoImpl(getIt<DatabaseServices>()),
  );

  getIt.registerSingleton<OrderRepo>(OrderRepoImpl(getIt<DatabaseServices>()));
}
