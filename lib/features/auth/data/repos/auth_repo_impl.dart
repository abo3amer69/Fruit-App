import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/exceptions.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/services/database_services.dart';
import 'package:fruit_app/core/services/firebase_auth_services.dart';
import 'package:fruit_app/core/utils/backend_endpoint.dart';
import 'package:fruit_app/features/auth/data/models/user_model.dart';
import 'package:fruit_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.databaseServices,
    required this.firebaseAuthServices,
  });
  @override
  Future<Either<Failure, UserEntity>> creatUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.creatUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uid: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log(
        'Exceptio in authrepoimpl.creatUserWithEmailAndPassword ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما . يرجى المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exceptio in authrepoimpl.creatUserWithEmailAndPassword ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما . يرجى المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exceptio in authrepoimpl.creatUserWithEmailAndPassword ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما . يرجى المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exceptio in authrepoimpl.creatUserWithEmailAndPassword ${e.toString()}',
      );
      return left(ServerFailure('لقد حدث خطأ ما . يرجى المحاولة في وقت لاحق'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServices.addData(
      path: BackendEndpoint.addUserData,
      data: user.tomap(),
    );
  }
}
