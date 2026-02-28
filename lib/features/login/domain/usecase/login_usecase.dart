import 'package:app_testes_unitarios/features/login/data/model/login_model.dart';
import 'package:app_testes_unitarios/features/login/data/model/user_model.dart';
import 'package:app_testes_unitarios/features/login/data/repositories/login_repositories.dart';

class LoginUsecase {


  final LoginRepositories repositories;

  LoginUsecase({required this.repositories});

  Future<LoginModel> login({required String username, required String password}) async {
    return await repositories.login(username: username, password: password);
  }

  Future<UserModel> getUser() async {
    return await repositories.getUser();
  }



}