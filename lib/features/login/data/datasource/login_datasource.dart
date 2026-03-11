import 'dart:convert';

import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class LoginDatasource {

  Future<LoginModel> login({required String email, required String password});
  Future<UserModel> register({ required String nome, required String phone, required String email, required String password});
  Future<void> logout();
 
}

class LoginRemoteDataSourceImpl implements LoginDatasource {

  final FirebaseAuth firebaseAuth;


  LoginRemoteDataSourceImpl(this.firebaseAuth);



  

  @override
Future<LoginModel> login({
  required String email,
  required String password,
}) async {
  try {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;

    if (user == null) {
      throw Exception('Usuário não encontrado');
    }

    return LoginModel.fromFirebase(user);
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message);
  }
}


  @override
  Future<UserModel> register({required String nome, required String phone, required String email, required String password}) async{
    final result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final uid = result.user?.uid;

    if (uid == null) {
      throw Exception('Não foi possível obter o UID do usuário após o cadastro');
    }

    final user = UserModel(
      id: uid,
      name: nome,
      phone: phone,
      email: email,
    );

    await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .set({
        ...user.toJson(),
        'createdAt': DateTime.now(),
      });

    return user;
  }

  
  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

}