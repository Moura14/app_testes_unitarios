import 'dart:convert';

import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class LoginDatasource {

  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({ required String nome, required String phone, required String email, required String password});
  Future<void> logout();
 
}

class LoginRemoteDataSourceImpl implements LoginDatasource {

  final FirebaseAuth firebaseAuth;


  LoginRemoteDataSourceImpl(this.firebaseAuth);



  

  @override
Future<UserModel> login({
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

    return UserModel.fromFirebase(user);
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message);
  }
}


  @override
  Future<UserModel> register({required String nome, required String phone, required String email, required String password}) async{
    final result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final user = result.user;

    print(user);

    if(user == null){
      throw Exception('Erro ao criar usuário');
    }

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'nome': nome,
      'phone': phone,
      'email': email,
      'createdAt': DateTime.now()

    });

    return UserModel.fromFirebase(user);
  }

  
  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

}