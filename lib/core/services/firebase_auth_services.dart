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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بتسجيل الدخول مسبقا . من فضلك قم بتسجيل الدخول',
        );
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى',
        );
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ الرجاء المحاولة مرة أخرى');
    }
  }
}
