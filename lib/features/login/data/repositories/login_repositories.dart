

import 'package:app_testes_unitarios/features/login/data/datasource/login_datasource.dart';
import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';

abstract class LoginRepositories {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({ required String nome, required String phone, required String email, required String password});
  
  
}

class LoginRepositoreisImpl implements LoginRepositories {

  final LoginDatasource loginDatasource;

  LoginRepositoreisImpl({required this.loginDatasource});

  @override
  Future<UserModel> login({required String email, required String password}) async {
    return await loginDatasource.login(email: email, password: password);
  }

   @override
  Future<UserModel> register({required String nome, required String phone, required String email, required String password}) async {
    return await loginDatasource.register(nome: nome, phone: phone, email: email, password: password);
  }


 
}