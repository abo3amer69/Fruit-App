import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uid});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

 factory UserModel.fromEntity(UserEntity user) {
   return UserModel(
     
     name: user.name,
     email: user.email,
     uid: user.uid
   );
 }


   tomap(){
    return {
      
      'name':name,
      'email':email,
      'uid':uid
    };
  }


}
