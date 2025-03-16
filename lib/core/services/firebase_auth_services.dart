import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_app/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

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

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  bool isLoggedIn() {
   return FirebaseAuth.instance.currentUser != null;
  }
}
