

import 'package:app_testes_unitarios/features/login/data/datasource/login_datasource.dart';
import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';

abstract class LoginRepositories {
  Future<LoginModel> login({required String username, required String password});
  Future<UserModel> getUser();
  
}

class LoginRepositoreisImpl implements LoginRepositories {

  final LoginDatasource loginDatasource;

  LoginRepositoreisImpl({required this.loginDatasource});

  @override
  Future<LoginModel> login({required String username, required String password}) async {
    return await loginDatasource.login(username: username, password: password);
  }

   @override
  Future<UserModel> getUser() async {
    return await loginDatasource.getUser();
  }


 
}