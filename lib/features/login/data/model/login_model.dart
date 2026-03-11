import 'package:app_testes_unitarios/features/login/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginModel extends UserEntity {
  LoginModel({
    required String id,
    required String email,
  }) : super(
          id: id,
          email: email,
        );

  factory LoginModel.fromFirebase(User user) {
    return LoginModel(
      id: user.uid,
      email: user.email ?? '',
    );
  }
}