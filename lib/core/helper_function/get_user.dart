import 'dart:convert';

import 'package:fruit_app/constants.dart';
import 'package:fruit_app/core/services/shared_preferences_singelton.dart';
import 'package:fruit_app/features/auth/data/models/user_model.dart';
import 'package:fruit_app/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = prefs.getString(kUserData);
  var userEntity = UserModel.fromjson(jsonDecode(jsonString));
  return userEntity;
}
