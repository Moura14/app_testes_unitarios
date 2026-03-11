import 'package:app_testes_unitarios/features/login/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String email,
  }) : super(
          id: id,
          email: email,
        );

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
    );
  }
}