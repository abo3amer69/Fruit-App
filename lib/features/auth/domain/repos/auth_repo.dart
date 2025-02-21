import 'package:fruit_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> creatUserWithEmailAndPassword(
    String email,
    String password,
  );
}
