import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> creatUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in firebaseauthservices.creatUserWithEmailAndPassword ${e.toString()}and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بتسجيل الدخول مسبقا . من فضلك قم بتسجيل الدخول',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى',
        );
      }
    } catch (e) {
      log(
        'Exception in firebaseauthservices.creatUserWithEmailAndPassword ${e.toString()}',
      );
      throw CustomException(message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in firebaseauthservices.signInWithEmailAndPassword ${e.toString()}and code is ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message:
              'لا يوجد حساب بهذا البريد الالكتروني . من فضلك قم بإنشاء حساب جديد',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'الرقم السري غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى',
        );
      }
    } catch (e) {
      log(
        'Exception in firebaseauthservices.signInWithEmailAndPassword ${e.toString()}',
      );
      throw CustomException(message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى');
    }
  }
}
